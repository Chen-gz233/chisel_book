package gemmini

import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import scala.util.Random

class Int8Test extends AnyFlatSpec with ChiselScalatestTester {
//用于存储软件模拟结果  
var re = 0
/*
    val weight = Array(

3,-26,48,-10,47,-53,-84,-83,112,
-71,101,-69,-3,63,-95,74,116,
-102,-10,78,-49,82,-58,-75,85,
6,53,112,-101,15,-40,10,104,
-93,5,107,81,-53,-48,-101,-70,
66,32,-45,40,14,-32,-27,-128,
65,-6,-36,12,-84,40,51,-64,
123,-124,73,114,34,62,-26,

    )

    val activate = Array( 

65,7,-6,118,-55,-46,107,-113,117,
-3,37,-127,-6,-105,45,98,48,
-25,122,-78,1,49,109,-77,46,
-65,-56,-36,122,-12,117,35,58,
26,74,48,27,-65,-37,79,96,
-55,38,94,114,82,6,122,-2,
3,-74,-104,-22,7,83,-101,-52,
118,50,16,32,96,84,-26,

    )
    
    val weight = (1 to 64).map(_ => Random.nextInt(256) - 128).toArray
    val activate = (1 to 64).map(_ => Random.nextInt(256) - 128).toArray
*/

    val weight = Array(
    3,-26,48,-10,47,-53,-84,-83,112,
    -71,101,-69,-3,63,-95,74,116,
    -102,-10,78,-49,82,-58,-75,85,
    6,53,112,-101,15,-40,10,104,
    -93,5,107,81,-53,-48,-101,-70,
    66,32,-45,40,14,-32,-27,-128,
    65,-6,-36,12,-84,40,51,-64,
    123,-124,73,114,34,62,-26
    )

    val activate = Array( 
    65,7,-6,118,-55,-46,107,-113,117,
    -3,37,-127,-6,-105,45,98,48,
    -25,122,-78,1,49,109,-77,46,
    -65,-56,-36,122,-12,117,35,58,
    26,74,48,27,-65,-37,79,96,
    -55,38,94,114,82,6,122,-2,
    3,-74,-104,-22,7,83,-101,-52,
    118,50,16,32,96,84,-26
    )
    
    println("#########weight:#########")
    for(i <- 0 until 64){
        //print(weight(i)+",") 
        print(s"${weight(i)},")

        if(i%8 === 0 & i !=0){
            println("")
        }
    }
    println("")
    println("")

    println("#########activate#########")
    for(i <- 0 until 64){
        //print(activate(i)+",") 
        print(s"${activate(i)},")
        if(i%8 === 0 & i !=0){
            println("")
        }
    }

  println("")
  for(i <- 0 until 64){
      re = weight(i)*activate(i) + re 
  }
  println("")
  println("软件模拟计算输出："+re)
  println("")

  "Waveform" should "pass" in { 
    //class gemminiPE(inputType: T, outputType: T, accType: T,val dataNumToPe: Int,val config: bitletPEconfigs[T]) extends Module
    //new gemminiPE(inputType, outputType, accType,dataNumToPe, bitletPEconfigs(inputType, 4))
    test(new gemminiPE(SInt(8.W), SInt(32.W),SInt(32.W), 64, bitletPEconfigs(SInt(8.W)))).withAnnotations(Seq(WriteVcdAnnotation))  {
      dut =>
        //初始化
        dut.io.in_valid.poke(false.B)
        for (i <- 0 until 64) {
          dut.io.in_b(i).poke(0.S)
          dut.io.in_a(i).poke(0.S)
        }
        dut.clock.step(1)
        dut.io.in_valid.poke(true.B)
        //开始赋值
        for (i <- 0 until 64) {
          dut.io.in_b(i).poke(weight(i).S)
          dut.io.in_a(i).poke(activate(i).S)
        }
        dut.clock.step(1)
        dut.io.in_valid.poke(false.B)

        dut.clock.step(100)
        println("bitlet计算输出:"+dut.io.dataOut.peek().toString)
        
       
    }
  } 
}
