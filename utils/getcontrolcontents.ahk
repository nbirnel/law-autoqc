#Persistent
ControlGetText, controltext, XTPStatusBar2, Law 
text := controltext
ToolTip, %text%
MsgBox, %text%
return

