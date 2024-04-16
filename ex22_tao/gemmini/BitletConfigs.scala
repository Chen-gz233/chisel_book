package gemmini

import chisel3._
import chisel3.SInt

case class bitletPEconfigs[T <: Data : Arithmetic](inputType:T,
//                          inputType: Datatype.Value = _,
//                          macnum: Int = 32,
                          windowsize: Int = 2
                        ) {
  val is_int8 = inputType match {
    case Float(8, 24) => false
    case Float(5, 11) => false
    case Float(8, 8) => false
    case _ => true
  }
  val data_width = inputType match {
    case Float(8,24) => 32
    case Float(5,11) => 16
    case Float(8,8) => 16
    case _ => 8
  }
  val manti_len = inputType match {
    case Float(8,24) => 23
    case Float(5,11) => 10
    case Float(8,8) => 7
    case _ => 6 // 7-1
  }

  val reg_num = inputType match {
    case Float(8,24) => 24 //24->12->6->3->2->1
    case Float(5,11) => 12 //11->6->3->2->1
    case Float(8,8) => 7 //8->4->2->1
    case _ => 7 //7->4->2->1
  }

  val exp_width = inputType match {
    case Float(8,24) => 8
    case Float(5,11) => 5
    case Float(8,8) => 8
    case _ => 0
  }

  val sign_where = inputType match {
    case Float(8,24) => 31
    case Float(5,11) => 15
    case Float(8,8) => 15
    case _ => 7
  }

  val exp_head = inputType match {
    case Float(8,24) => 30
    case Float(5,11) => 14
    case Float(8,8) => 14
    case _ => 0
  }

  val exp_tail = inputType match {
    case Float(8,24) => 23
    case Float(5,11) => 10
    case Float(8,8) => 7
    case _ => 0
  }
}
