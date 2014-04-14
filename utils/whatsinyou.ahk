#include window_functions.ahk

law=LAW ahk_class ThunderRT6FormDC
fnWindow(law)
WinGet, ActiveControlList, ControlList, A
Loop, Parse, ActiveControlList, `n
{
    ControlGetText, text, %A_LoopField%, A

    ;MsgBox, 4,, Control #%a_index% is "%A_LoopField%" text is %text%. Continue?
    line = %A_LoopField%: %text% `n
    FileAppend, %line%, op.txt

}
