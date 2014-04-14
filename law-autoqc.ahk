
;WinGet, id, list,,, Program Manager
;Loop, %id%
;{
;    this_id := id%A_Index%
;    WinActivate, ahk_id %this_id%
;    WinGetClass, this_class, ahk_id %this_id%
;    WinGetTitle, this_title, ahk_id %this_id%
;    MsgBox, 4, , Visiting All Windows`n%a_index% of %id%`nahk_id %this_id%`nahk_class %this_class%`n%this_title%`n`nContinue?
;    IfMsgBox, NO, break
;}
;
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
    auto_qc_speed := auto_qc_speed + by
    MsgBox, %auto_qc_speed%
}

auto_qc()

Space::toggle_auto_qc()
,::adjust_speed(-500)
.::adjust_speed(500)


