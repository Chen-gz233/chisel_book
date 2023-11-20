import chisel3._
import chisel3.util._



class FSM extends  Module{

    val io = IO(new Bundle{
        val in = Input(UInt(1.W))
        val out = Output(UInt(1.W))
    })



    //很奇怪，必须要多一个状态 否则无法识别s9
    val   s1 :: s2 :: s3 :: s4 :: s5 :: s6 :: s7 :: s8 :: s9 ::nano = Enum(10)
    val stage = RegInit(s1)
    //这里原本设计是Reg类型，但是会有一拍的延迟，所以后面改为Wire类型
    val outReg = Wire(UInt(1.W))

    outReg := 0.U


    //友情提醒，switch is 中不能直接给IO赋值
    //否则报错。改道用When就可以可以直接给IO赋值
    switch(stage){
        is(s1){
            when(io.in === 0.U){
                stage := s2
            }.otherwise{
                stage := s6
            } 
        }
        is(s2){
            when(io.in === 0.U){
                stage := s3
                outReg := 0.U
            }.otherwise{
                stage := s6
                outReg := 0.U
            } 
        }

        is(s3){
            when(io.in === 0.U){
                stage := s4
            }.otherwise{
                stage := s6
            } 
        }
        is(s4){
            when(io.in === 0.U){
                stage := s5
            }.otherwise{
                stage := s6
            } 
        }
        is(s5){
            when(io.in === 0.U){
                stage := s5
                outReg := 1.U
            }.otherwise{
                stage := s6
            } 
        }

        is(s6){
            when(io.in === 0.U){
                stage := s2
                outReg := 0.U
            }.otherwise{
                stage := s7
                outReg := 0.U
            } 
        }
        is(s7){
            when(io.in === 0.U){
                stage := s2
            }.otherwise{
                stage := s8
            } 
        }

        is(s8){
            when(io.in === 0.U){
                stage := s2
            }.otherwise{
                stage := s9
            } 
            }

        is(s9){
                when(io.in === 0.U){
                    stage := s2
                }.otherwise{
                    stage := s9
                    outReg := 1.U
                } 
            }
    }

io.out := outReg
}

object MyFSM extends App{
    emitVerilog (new FSM(),Array("--target-dir","generate") )
}