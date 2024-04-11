# 复习一下状态机

## moore状态机

$f(input，current\_state)=next\_state$

$f(current\_state) = output$

输出只由$current\_state$决定


## mealy状态机
$f(input，current\_state)=next\_state$

$f(current\_state,input) = output$

output不光只看current_state，input也在计算输出逻辑中掺了一脚