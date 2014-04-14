#include window_functions.ahk
auto_qc_speed := 3000
auto_qc_on := false

toggle_auto_qc()
{
    global auto_qc_on
    auto_qc_on := !auto_qc_on
}

auto_qc()
{
    law=LAW ahk_class ThunderRT6FormDC
    global auto_qc_on
    global auto_qc_speed
    loop
    {
        if auto_qc_on 
        {
            fnWindow(law)
            Send, {Down}
            Sleep, %auto_qc_speed%
        }
    }
}

adjust_speed(by)
{
    global auto_qc_speed
    auto_qc_speed += by
}

auto_qc()

q::toggle_auto_qc()
,::adjust_speed(-500)
.::adjust_speed(500)


