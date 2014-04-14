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
    global auto_qc_on
    global rollover_t
    loop
    {
        if auto_qc_on 
        {
            move("{Down}")
            loop
            {
                if (A_TickCount >= rollover_t)
                    break
            }
        }
    }
}

adjust_speed(by)
{
    global auto_qc_speed
    auto_qc_speed += by
}

move(direction, halt=false)
{
    global auto_qc_on
    global rollover_t
    global auto_qc_speed
    law=LAW ahk_class ThunderRT6FormDC

    rollover_t := A_TickCount + auto_qc_speed
    fnWindow(law)
    Send, %direction%
    if halt
        auto_qc_on := false

}

auto_qc()

Space::toggle_auto_qc()
,::adjust_speed(-500)
.::adjust_speed(500)
$Down::move("{Down}")
$Up::move("{Up}", "halt")
$Right::move("{Right}", "halt")
$Left::move("{Left}", "halt")
F12::Suspend
