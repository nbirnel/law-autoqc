fn_getY_offset()
{
    global Y_offset
    twips_per_pixel = -15
    key = Control Panel\Desktop\WindowMetrics
    RegRead, Titlebar_height, HKCU, %key%, CaptionHeight
    Y_offset := Titlebar_height / twips_per_pixel
    Transform, Y_offset, Round, %Y_offset%
    return Y_offset
}

fnOffset_Y(orig_y)
{
    global Y_offset
    return orig_y + Y_offset
}

fnNoOp(a = 0, b = 0, c = 0, d = 0)
{
}

fnClickSleep(x, y)
{
    MouseClick, left,  x,  fnOffset_Y(y)
    Sleep, 100
}
    
fnWindow(window)
{
    ; Always check the return value of this function!
    WinWait, %window%, ,WAIT_SECS
    if ErrorLevel
        exit 1
    IfWinNotActive, %window%, , WinActivate, %window%, 
    WinWaitActive, %window%, 
}

fn1Click(window, x, y)
{
    fnWindow(window)
    fnClickSleep(x, y)
}

fn2Click(window, xa, ya, xb, yb)  ;two clicks
{
    fnWindow(window) 
    fnClickSleep(xa, ya)
    fnClickSleep(xb, yb)
}

fnDoubleClick(window, x, y)   ;double click
{
    fnWindow(window)
    MouseClick, left,  x, fnOffset_Y(y)
    MouseClick, left,  x, fnOffset_Y(y)
    Sleep, 100
}

fnMouseMove(x_Direction = 0, y_Direction = 0)
{
    MouseMove, %x_Direction%, %y_Direction%, , R
    Click
}
