# ISA & 参考
  https://msyksphinz-self.github.io/riscv-isadoc/html/index.html

  https://blog.csdn.net/qq_61653333/article/details/138390188

  https://nju-projectn.github.io/dlco-lecture-note/index.html

  https://blog.csdn.net/heyangge/article/details/134502174

  CPU数据通路中的三个重要部分：**寄存器堆**、**ALU**和**数据存储器**，并通过功能仿真测试。
# RISC-V指令的特点
    R-type：寄存器与寄存器算术指令，这里的R就是register寄存器的意思；
    I-type：寄存器与立即数算术指令或者加载指令；
    S-type：存储指令（和上面的加载指令刚好是反义词）；
    B-type：条件跳转指令；
    U-type：长立即数操作指令；
    J-type：无条件跳转指令。


# 一个单周期处理器的运行流程大致如下：

    1. 程序计数器 (PC)
    2. 指令存储器 (INSTRUCTION_MEM)
    3. 指令解码 (ID)
    4. 控制器 (CONTROLLER)
    5. 立即数生成器 (IMM)
    6. 寄存器文件 (REG_FILE)
    7. 多路选择器 (MUX)
    8. 算术逻辑单元 (ALU)
    9. 数据存储器 (DATA_MEM)
    10. 下一条指令地址计算 (NEXT_PC)

# 实现指令

##  addi
寄存器与立即数做加法

31-27 26-25 24-20 19-15 14-12|11-7|6-2|1-0
|----------------------------|----|---|---|
  imm[31:12] |rd|00101|11

**格式**   addi rd,rs1,imm

**描述** 将符号扩展的 12 位立即数加 到寄存器 rs1。忽略算术溢出，结果只是简单的低 XLEN 位。 

ADDI rd, rs1, 0 用于实现MV rd, rs1 汇编器伪指令。

**实现** x[rd] = pc + sext(immediate[31:12] << 12)

##  sw(store word)
一个**字**(word)是**32位**(4个字节)的数据

31-27 26-25|24-20|19-15|14-12|11-7|6-2|1-0
|----------|-----|-----|-----|----|---|---|
offset[11:5]|rs2|rs1|010|offset[4:0]|01000|11

**格式**   sw rs2,offset(rs1)

**描述** 将寄存器 rs2 的低位中的 32 位值存储到内存中

**实现** M[x[rs1] + sext(offset)] = x[rs2][31:0]

##  lw(load word)
一个**字**(word)是**32位**(4个字节)的数据

31-27 26-25 24-20|19-15|14-12|11-7|6-2|1-0
|----------------|-----|-----|----|---|---|
offset[11:0]|rs1|010|rd|00000|11

**格式**    lw rd,offset(rs1)

**描述** 从内存加载一个 32 位值，并将其符号扩展为 XLEN 位，然后将其存储到寄存器 rd 中。

**实现** x[rd] = sext(M[x[rs1] + sext(offset)][31:0])

##  jal
无条件的**跳转**并**链接**的指令

31-27 26-25 24-20|19-15 14-12|11-7|6-2|1-0
|----------------|-----------|----|---|---|
offset[20] offset[10:1] offset[11] | offset[19:12] |rd|11011|11

**格式**    jal rd,offset

**描述** 跳转到地址并将返回地址放入rd 中。

**实现** x[rd] = pc+4; pc += sext(offset)

##  li
lui 的伪指令，加载高位立即数

31-27 26-25 24-20|19-15 14-12|11-7|6-2|1-0
|----------------|-----------|----|---|---|
offset[20] offset[10:1] offset[11] | offset[19:12] |rd|11011|11

**格式**    lui rd, immediate

**描述** 将20位的有符号数左移12位,写入x[rd]中，将低12位置0

**实现** x[rd] = sext(immediate[31:12]<<12)