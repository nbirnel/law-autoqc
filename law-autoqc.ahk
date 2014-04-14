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
            move_down()
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

move(direction)
{
    global rollover_t
    global auto_qc_speed
    law=LAW ahk_class ThunderRT6FormDC

    rollover_t := A_TickCount + auto_qc_speed
    fnWindow(law)
    Send, %direction%
}


move_down()
{
    move("{Down}")
}

move_up()
{
    global auto_qc_on
    move("{Up}")
    auto_qc_on := false
}

auto_qc()

Space::toggle_auto_qc()
,::adjust_speed(-500)
.::adjust_speed(500)
$Down::move_down()
$Up::move_up()
