chisel寄存器 
三种初始化：


val register = Reg(UInt(12.W))                //定义一个寄存器变量
val myReg_1 = RegInit(UInt(12.W), 0.U)          //定义寄存器并初始化为0
val myReg_2 = RegInit(0.U(12.W))



chisel io 相当于wire 一瞬间传值