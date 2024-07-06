 
  
import chisel3._  
import chiseltest._ // 注意这里从 chiseltest 导入  
import org.scalatest.flatspec.AnyFlatSpec  
  

  
class MeshNew2Test extends AnyFlatSpec with ChiselScalatestTester {  
  "MeshNew2" should "perform some specific test" in {  
    // 设置默认后端名称（如果需要）  
    //chiseltest.testers.TestOptions.setDefaultBackendName("c")  
  
    test(new MeshNew2(3, 3)) { dut => // 注意这里不需要再调用 Module  
      // 这里是您的测试逻辑  
      // ...  
  
      // 例如，如果您想要生成随机输入并检查输出  
      val random = new scala.util.Random  
      for (_ <- 0 until 10) { // 假设您想要运行10个时钟周期  
        // 假设 MeshNew2 有一个 io.in 和 io.out 接口  
        //val inValue = random.nextInt(16).U // 假设输入是4位宽度  
        //dut.io.in_b.poke(inValue)  
        dut.clock.step(1) // 前进一个时钟周期  
        // 检查输出或其他信号  
        println(s" Output: ${dut.io.in_b.peek()}")  
      }  
    }  
  }  
}