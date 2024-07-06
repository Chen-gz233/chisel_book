## 一个单周期处理器的运行流程大致如下：

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