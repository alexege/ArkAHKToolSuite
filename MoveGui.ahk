#SingleInstance force
SetWorkingDir, A_ScriptDir
; Initialize the .ini file to keep track of settings
if !FileExist("settings.ini")
    Fileappend,% "[section]`nkey=", settings.ini
SysGet, sizeframe, 33
SysGet, cyborder, 8
Gui info:Add, Text, x0 w100 Center, Script
Gui info:Add, Text, vcurrentAction w100 y+5 Center, Status: Paused
Gui info:Add, GroupBox, xp+10 yp+20 w150 h100, Commands `t Actions
Gui info:Add, ListView, r20 w200 , Hotkey | Action
Gui info:Add, Text, xp+20 yp+20, F1`t Start / Stop
; Gui info:+AlwaysOnTop -Caption -Label -MaximizeBox -Theme
Gui info:+AlwaysOnTop +LastFound  +ToolWindow -Caption +Border
; Gui info:Show
LV_ModifyCol()
LV_Add("F1", "Start / Stop Script")
LV_Add("F1", "Start / Stop Script")
LV_Add("F1", "Start / Stop Script")
LV_Add("F1", "Start / Stop Script")
LV_Add("F1", "Start / Stop Script")
LV_Add("F1", "Start / Stop Script")
LV_Add("F1", "Start / Stop Script")
Gui info: Show
return

infoGuisize:
guiheight := A_guiheight
guiwidth := A_guiwidth
Gui info:Show, % "x" A_ScreenWidth / 2 - GuiWidth / 2 - sizeframe / 2 - cyborder " y"  cyborder " w" Guiwidth " h" GuiHeight
; MsgBox %guiheight% %guiwidth%
return


; ButtonSave:                                                                   ; IniWrite
; Gui, Submit, NoHide
; IniWrite, %MyGUI%, GUI.ini, Section, GUI key 
; Return
; ButtonLoad:                                                                   ; IniRead
; IniRead, iniValue, GUI.ini, Section, GUI key 
; GuiControl, , GUIID, %MyGUI%
; Return
; iniValue := StrReplace(MyGUI, "`n", "``n")
; <save>
; <load>
; iniValue := StrReplace(iniValue, "``n", "`n")
; GuiControl, Text, MyGUI, %iniValue%
F4::
Gui settings: Add, Text,, Settings
Gui settings: Add, CheckBox, vMyCheckbox y20 checked, % "Check me!"
Gui settings: Show
return
Esc::
MsgBox 4, Confirm, Really Exit?
IfMsgBox, No
    Return
ExitApp 
return
; !q::
; GuiControl info:,currentAction, New Action Name
; return
; infoGuiClose:
; ExitApp
; return
