#include <stdio.h>
#include <stdlib.h>
#define N 6
unsigned int get_signed_bit(float f)
{
    unsigned tmp = *(unsigned int *)(&f);
    return (tmp >> 31);
}
unsigned int get_exponent(float f)
{
    unsigned tmp = *(unsigned int *)(&f);
    tmp >>= 23;
    return (tmp & ((1 << 8) - 1));
}
unsigned int get_mantissa(float f)
{
    unsigned tmp = *(unsigned int *)(&f);
    return ((tmp & ((1 << 23) - 1)) | (1 << 23));
}
static float make_float(unsigned int signed_bit, unsigned int exponent, unsigned int mantissa)
{
    unsigned int result = 0;
    result |= (signed_bit << 31);
    result |= (exponent << 23);
    result |= (mantissa & ((1 << 23) - 1));
    float *res_float = (float *)(&result);
    return *res_float;
}

static void int2str_radix2(unsigned int num, int bits, char *str)
{
    for (int i = 0; i < bits; i++)
    {
        if (num & (1 << i))
        {
            str[bits - i - 1] = '1';
        }
        else
        {
            str[bits - i - 1] = '0';
        }
    }
    str[bits] = 0;
}
static int is_RR_regs_all_zero(unsigned long long *RR_regs)
{
    unsigned long long res = 0;
    for (int b = 0; b < 24; b++)
    {
        res |= RR_regs[b];
    }
    return (res == 0);
}

static int get_essence_bit(unsigned long long RR_reg)
{
    for (int i = 0; i < N; i++)
    {
        if (RR_reg & (1 << i))
            return i;
    }
    return -1;
}
static int get_msb(unsigned int mantissa)
{
    for (int i = 31; i >= 0; i--)
    {
        if (mantissa & (1 << i))
            return i;
    }
    return -1;
}
float BCE_FP32_N(float *weight, float *activation)
{
    unsigned int signed_bit_weight[N];
    unsigned int exponent_weight[N];
    unsigned int mantissa_weight[N];
    unsigned int signed_bit_activation[N];
    unsigned int exponent_activation[N];
    unsigned int mantissa_activation[N];
    unsigned int signed_bit_sum_weight_activation[N];
    int exponent_sum_weight_activation[N];
    int E_max = -256;               // FIXME: when N > 128 will fail
    unsigned long long RR_regs[24]; // FIXME: sizeof tmp_str is max(N + 1, 25)
    char tmp_str[25];
    unsigned int result_signed = 0;
    unsigned int result_exponent;
    unsigned int accu_mantissa = 0;
    // 1. preprocessing the floating-points weights
    for (int i = 0; i < N; i++)
    {
        signed_bit_weight[i] = get_signed_bit(weight[i]);
        exponent_weight[i] = get_exponent(weight[i]);
        mantissa_weight[i] = get_mantissa(weight[i]);
        signed_bit_activation[i] = get_signed_bit(activation[i]);
        exponent_activation[i] = get_exponent(activation[i]);
        mantissa_activation[i] = get_mantissa(activation[i]);
        signed_bit_sum_weight_activation[i] = (signed_bit_weight[i] + signed_bit_activation[i]) % 2;
        exponent_sum_weight_activation[i] = exponent_weight[i] + exponent_activation[i] - 254;
        if (exponent_sum_weight_activation[i] > E_max)
        {
            E_max = exponent_sum_weight_activation[i];
        }
        int2str_radix2(mantissa_weight[i], 24, tmp_str);
        printf("weights[%d] = %f, exp_w = 0x%X,\tmantissa_w = %d'b%s\n", i, weight[i], exponent_weight[i], 23, tmp_str);
        printf("activations[%d] = %f, exp_a = 0x%X, mantissa_w = 0x%X, E_i = %d\n", i, activation[i], exponent_activation[i], mantissa_activation[i], exponent_sum_weight_activation[i]);
    }
    printf("E_max = %d\n", E_max);
    // 2. dynamic exponent matching
    for (int i = 0; i < N; i++)
    {
        int E_i_diff = E_max - exponent_sum_weight_activation[i];
        mantissa_weight[i] >>= E_i_diff;
        int2str_radix2(mantissa_weight[i], 24, tmp_str);
        printf("mantissa_w[%d] = %d'b%s after dynamic exponent matching, E_i_diff = %d\n", i, 23, tmp_str, E_i_diff);
    }
    // 3. wire orchestrator
    for (int b = 0; b <= 23; b++)
    {
        RR_regs[b] = 0;
        for (int i = 0; i < N; i++)
        {
            RR_regs[b] |= (((mantissa_weight[i] & (1 << b)) >> b) << i);
        }
        int2str_radix2(RR_regs[b], N, tmp_str);
        printf("RR_regs[%2d] = %d'b%s\n", b, N, tmp_str);
    }
    // 4. bit distillation & accumulate mantissa of activations
    for (int i = 0; i < N; i++)
    {
        if (is_RR_regs_all_zero(RR_regs))
            break;
        printf("Round %d: accumulate mantissa of ", i + 1);
        for (int b = 23; b >= 0; b--)
        {
            int essence_bit = get_essence_bit(RR_regs[b]);
            if (essence_bit >= 0)
            {
                printf("(act[%d] >> %d), ", essence_bit, 23 - b);
                if (result_signed == signed_bit_sum_weight_activation[essence_bit])
                {
                    accu_mantissa += ((mantissa_activation[essence_bit]) >> (23 - b));
                    // FIXME: Rounding mode
                    if (((23 - b) > 0) && ((mantissa_activation[essence_bit]) & (1 << (22 - b))))
                    {
                        accu_mantissa++;
                    }
                }
                else
                {
                    // FIXME: -0.0f had better changed to +0.0f although they are the same
                    if (((mantissa_activation[essence_bit]) >> (23 - b)) > accu_mantissa)
                    {
                        result_signed = 1 - result_signed;
                        // FIXME: accu_mantissa may overflow or underflow
                        accu_mantissa = ((mantissa_activation[essence_bit]) >> (23 - b)) - accu_mantissa;
                    }
                    else
                    {
                        accu_mantissa -= ((mantissa_activation[essence_bit]) >> (23 - b));
                    }
                } // Clear essence bit of RR_regs[b]
                RR_regs[b] &= ~(1 << essence_bit);
            }
        }
        printf("\n");
    }

    // 5. normalize result
    int fix_exp = get_msb(accu_mantissa) - 23;
    E_max += fix_exp;
    result_exponent = E_max + 127;
    if (fix_exp > 0)
        accu_mantissa >>= fix_exp;
    else
        accu_mantissa <<= -fix_exp;
    float final_float_accu_result = make_float(result_signed, result_exponent, accu_mantissa);
    printf("Normalize result: Signed_bit = %d, fix_exp = %d, E_max = %d, Mantissa = 0x%X, result = %f\n", result_signed, fix_exp, E_max, accu_mantissa, final_float_accu_result);
    return final_float_accu_result;
}
int main()
{
    float weights[N] = {12.625f, 5.15625f, 9.75f, 1.625f, 0.25f, 76.25f};
    float activations[N] = {-2.1f, 2.5f, 2.3f, -2.1f, -2.0f, -2.0f};
    float normal_float_accu_result = 0.0f;
    BCE_FP32_N(weights, activations);
    for (int i = 0; i < N; i++)
    {
        normal_float_accu_result += weights[i] * activations[i];
    }
    printf("Golden result: Signed_bit = %d, Exp = %d, Mantissa = 0x%X, result = %f\n", get_signed_bit(normal_float_accu_result), get_exponent(normal_float_accu_result), get_mantissa(normal_float_accu_result), normal_float_accu_result);
    return 0;
}