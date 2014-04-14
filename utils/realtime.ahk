#Persistent
SetTimer, WatchActiveWindow, 200
return
WatchActiveWindow:
WinGet, ControlList, ControlList, A
MouseGetPos,,,,control
ToolTip, %ControlList%
return

