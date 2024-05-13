import chisel3._
import chisel3.util._



class FSM extends  Module{

    val io = IO(new Bundle{
        val out = Output(UInt(1.W))
    })

    val STATE_A = 0.U  
    val STATE_B = 1.U  
    val currentState = RegInit(STATE_A) 
  
    val fire_counter = RegInit(0.U(3.W))
    val fire_counter_1 = RegInit(0.U(3.W))
    val total_fires = 8.U

    when(fire_counter < total_fires){
        fire_counter := fire_counter+1.U
    }.otherwise{
        fire_counter := 0.U
    }

    when(fire_counter_1 < total_fires && currentState === STATE_B){
        fire_counter_1 := fire_counter_1+1.U
    }.otherwise{
        fire_counter_1 := 0.U
    }
    

    when (currentState === STATE_A) {  //0
        io.out := 0.U  
        when (fire_counter === (total_fires - 1.U)) {  
            currentState := STATE_B  
        }  
    }.otherwise{ 
        io.out := 1.U
        when(fire_counter_1 === (total_fires - 1.U)){     
           currentState := STATE_A  
        }
    
    }

}

object MyFSM extends App{
    emitVerilog (new FSM(),Array("--target-dir","generate") )
}