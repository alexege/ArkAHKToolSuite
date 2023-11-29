#SingleInstance Force
CoordMode, ToolTip, Screen
SetTitleMatchMode 2
Mode = 0
ClickDisable = 0
AutoRunEnable = -1
AutoSprintEnable = -1
HeavyTargetingX = 750
HeavyTargetingY = 546
TekTargetingX = 750
TekTargetingY = 614
OnlySurvivorsX = 850
OnlySurvivorsY = 750
SurvivorsTamesX = 700
SurvivorsTamesY = 550
SurvivorsMountedX = 1200
SurvivorsMountedY = 600
TamesOnlyX = 1150
TamesOnlyY = 350
TekTurretRangeX = 785
TekTurretRangeY = 418
HeavyTurretRangeX = 856
HeavyTurretRangeY = 358
LowRangeX = 750
LowRangeY = 500
MediumRangeX = 960
MediumRangeY = 743
HighRangeX=1150
HighRangeY=500
RenameTekX = 1164
RenameTekY = 513
RenameHeavyX = 1165
RenameHeavyY = 538
RenameTextX = 950
RenameTextY = 500
PinCodeX = 1141
PinCodeY = 430
ClearPinX = 1161
ClearPinY = 511
RemoteSearchX = 1250
RemoteSearchY = 180
RemoteDropX = 1450
RemoteDropY = 190
RemoteTransferAllX = 1400
RemoteTransferAllY = 190
LocalSearchX = 175
LocalSearchY = 180
LocalTransferAllX = 350
LocalTransferAllY = 190
InvPixelX = 1488
InvPixelY = 180
DropTimer = 120000
ClickingTimer = 500
ClickTimes = 1
tmp = LMB
SetTimer ef3key, %DropTimer%
SetTimer ClickKey, %ClickingTimer%
Gui, Font, s15 black
Gui, Add, Text, x75 y2, Autofarm(F3):
Gui, Font, s10 black
Gui, Add, Text, x1 y+2, Drop interval:
Gui, Add, Edit, x+10 vdtimer, %DropTimer%
Gui, Add, Text, x+4, ms
Gui, Add, Button, x+10 w50 h25 gButtonDropApply, Apply
Gui, Add, Text, x1 y+10, Drop:
Gui, Add, CheckBox, x+36 vdHide, Hide
Gui, Add, CheckBox, x+17 vdChitin, Chitin
Gui, Add, CheckBox, x+27 vdRaw, Raw
Gui, Add, CheckBox, x1 y+5 vdStone, Stone
Gui, Add, CheckBox, x+11 vdFlint, Flint
Gui, Add, CheckBox, x+22 vdWood, Wood
Gui, Add, CheckBox, x+22 vdMetal, Metal
Gui, Add, CheckBox, x1 y+8 vdThatch, Thatch
Gui, Add, CheckBox, x+5 vdCrystal, Crystal
Gui, Add, CheckBox, x+5 vdObsidian, Obsidian
Gui, Add, CheckBox, x+5 vdBerry, Berry
Gui, Add, Text, x1 y+10 w281 0x10
Gui, Add, Text, x280 y1 h138 0x11
Gui, Font, s15 black
Gui, Add, Text, x70 y140, AutoClicker(F4):
Gui, Font, s10 black
Gui, Add, Text, x1 y+5, Clicking interval:
Gui, Add, Edit, x+10 w50 vctimer, %Clickingtimer%
Gui, Add, Text, x+4, ms
Gui, Add, Button, x+10 w50 h25 gButtonClickApply, Apply
Gui, Add, Text, x1 y+5, Click:
Gui, Add, Edit, x+10 w25 h20 vctimes, %ClickTimes%
Gui, Add, Text, x+4, times
Gui, Add, Text, x1 y+10, Button:
Gui, Add, Edit, x+10 vcbutton, LMB
Gui, Add, Text, x1 y+10 w281 0x10
Gui, Add, Text, x280 y137 h126 0x11
Gui, Font, s15 black
Gui, Add, Text, x165 y265, Turret Settings(F1):
Gui, Font, s8 red
Gui, Font, s10 black
Gui, Add, Radio, x1 y+5 vtHeavy, Auto/Heavy
Gui, Add, Radio, x+5 vtTek, Tek
Gui, Add, CheckBox, x+72 vPinSet, Pin code already set?
Gui, Add, Text, x1 y+10, Targeting:
Gui, Add, DropDownList, x+5 vTurretTargeting, DNT||Survivors|S&T|S&Mounted T|Tames only
Gui, Add, Text, x+5 ,Rename:
Gui, Add, Edit, x+5 w100 vTurretName, DNT
Gui, Add, Text, x1 y+20, Range:
Gui, Add, DropDownList, x+22 vTurretRange, DNT||Low|Medium|High
Gui, Add, Text, x+5, Pin Code:
Gui, Add, Edit, x+2 w100 vTurretPin, DNT
Gui, Add, Button, x+10 y300 w100 h100 gButtonTurretApply, Apply
Gui, Add, Text, x280 y260 w281 0x10
Gui, +AlwaysOnTop
Gui, Color, 4d004d
Gui, Show, w500 h410, Ark AHK Tool Suite by Alexege
return
ButtonDropApply:
GuiControlGet, dtimer
GuiControlGet, dStone
GuiControlGet, dFlint
GuiControlGet, dWood
GuiControlGet, dThatch
GuiControlGet, dMetal
GuiControlGet, dCrystal
GuiControlGet, dObsidian
GuiControlGet, dBerry
GuiControlGet, dHide
GuiControlGet, dChitin
GuiControlGet, dRaw
SetTimer ef3key, %dtimer%
Return
ButtonClickApply:
GuiControlGet, ctimer
GuiControlGet, ctimes
GuiControlGet, cbutton
SetTimer Clickkey, %ctimer%
Return
ButtonTurretApply:
GuiControlGet, tHeavy
GuiControlGet, tTek
GuiControlGet, TurretTargeting
GuiControlGet, TurretRange
GuiControlGet, TurretPin
GuiControlGet, TurretName
GuiControlGet, PinSet
Return
RCtrl::
If(AutoRunEnable = -1)
ControlSend, ahk_parent, {w down}, ArkAscended
Else
ControlSend, ahk_parent, {w up}, ArkAscended
AutoRunEnable*=-1
return
RShift::
If(AutoSprintEnable = -1)
ControlSend, ahk_parent, {LShift down}, ArkAscended
Else
ControlSend, ahk_parent, {LShift up}, ArkAscended
AutoSprintEnable*=-1
return
F3::ef3Toggle := !ef3Toggle
ef3key:
If (!ef3Toggle)
Return
{
If (Mode = 0)
Loop
{
ClickDisable = 1
Sleep 500
ControlSend, ahk_parent, f, ArkAscended
Sleep 500
If(dStone)
{
ControlClick, x%RemoteSearchX% y%RemoteSearchY%, ahk_exe ArkAscended.exe,,,,NA
ControlSend, ahk_parent, stone, ArkAscended
Sleep 500
ControlClick, x%RemoteDropX% y%RemoteDropY%, ahk_exe ArkAscended.exe,,,,NA
Sleep 500
}
if(dFlint)
{
ControlClick, x%RemoteSearchX% y%RemoteSearchY%, ahk_exe ArkAscended.exe,,,,NA
ControlSend, ahk_parent, flint, ArkAscended
Sleep 500
ControlClick, x%RemoteDropX% y%RemoteDropY%, ahk_exe ArkAscended.exe,,,,NA
Sleep 500
}
if(dWood)
{
ControlClick, x%RemoteSearchX% y%RemoteSearchY%, ahk_exe ArkAscended.exe,,,,NA
ControlSend, ahk_parent, wood, ArkAscended
Sleep 500
ControlClick, x%RemoteDropX% y%RemoteDropY%, ahk_exe ArkAscended.exe,,,,NA
Sleep 500
}
if(dThatch)
{
ControlClick, x%RemoteSearchX% y%RemoteSearchY%, ahk_exe ArkAscended.exe,,,,NA
ControlSend, ahk_parent, thatch, ArkAscended
Sleep 500
ControlClick, x%RemoteDropX% y%RemoteDropY%, ahk_exe ArkAscended.exe,,,,NA
Sleep 500
}
if(dMetal)
{
ControlClick, x%RemoteSearchX% y%RemoteSearchY%, ahk_exe ArkAscended.exe,,,,NA
ControlSend, ahk_parent, metal, ArkAscended
Sleep 500
ControlClick, x%RemoteDropX% y%RemoteDropY%, ahk_exe ArkAscended.exe,,,,NA
Sleep 500
}
if(dCrystal)
{
ControlClick, x%RemoteSearchX% y%RemoteSearchY%, ahk_exe ArkAscended.exe,,,,NA
ControlSend, ahk_parent, crystal, ArkAscended
Sleep 500
ControlClick, x%RemoteDropX% y%RemoteDropY%, ahk_exe ArkAscended.exe,,,,NA
Sleep 500
}
if(dObsidian)
{
ControlClick, x%RemoteSearchX% y%RemoteSearchY%, ahk_exe ArkAscended.exe,,,,NA
ControlSend, ahk_parent, obsidian, ArkAscended
Sleep 500
ControlClick, x%RemoteDropX% y%RemoteDropY%, ahk_exe ArkAscended.exe,,,,NA
Sleep 500
}
if(dHide)
{
ControlClick, x%RemoteSearchX% y%RemoteSearchY%, ahk_exe ArkAscended.exe,,,,NA
ControlSend, ahk_parent, hide, ArkAscended
Sleep 500
ControlClick, x%RemoteDropX% y%RemoteDropY%, ahk_exe ArkAscended.exe,,,,NA
Sleep 500
}
if(dChitin)
{
ControlClick, x%RemoteSearchX% y%RemoteSearchY%, ahk_exe ArkAscended.exe,,,,NA
ControlSend, ahk_parent, chitin, ArkAscended
Sleep 500
ControlClick, x%RemoteDropX% y%RemoteDropY%, ahk_exe ArkAscended.exe,,,,NA
Sleep 500
}
if(dRaw)
{
ControlClick, x%RemoteSearchX% y%RemoteSearchY%, ahk_exe ArkAscended.exe,,,,NA
ControlSend, ahk_parent, raw, ArkAscended
Sleep 500
ControlClick, x%RemoteDropX% y%RemoteDropY%, ahk_exe ArkAscended.exe,,,,NA
Sleep 500
}
if(dBerry)
{
ControlClick, x%RemoteSearchX% y%RemoteSearchY%, ahk_exe ArkAscended.exe,,,,NA
ControlSend, ahk_parent, berry, ArkAscended
Sleep 500
ControlClick, x%RemoteDropX% y%RemoteDropY%, ahk_exe ArkAscended.exe,,,,NA
Sleep 500
}
ControlClick, x%RemoteSearchX% y%RemoteSearchY%, ahk_exe ArkAscended.exe,,,,NA
ControlSend, ahk_parent, {Esc}, ArkAscended
ControlSend, ahk_parent, {Esc}, ArkAscended
ClickDisable = 0
Break
}
}
return
F4::CToggle := !CToggle
ClickKey:
If (!CToggle or ClickDisable == 1)
Return
Loop, %ctimes%
{
If("C" cbutton == "C" tmp)
ControlClick, x55 y77, ahk_exe ArkAscended.exe,,,,NA
Else
{
ControlSend, ahk_parent, %cbutton%, ArkAscended
Sleep 500
}
}
return
F1::
If(tTek)
{
if(PinSet==1)
{
Send {e down}
Sleep 250
MouseMove, ClearPinX, ClearPinY, 1
Sleep 250
Send {Click}
Send {e up}
}
if(TurretTargeting != "DNT")
{
Sleep 250
Send {e down}
Sleep 250
MouseMove, TekTargetingX, TekTargetingY, 1
Sleep 250
Send {Click}
}
if(TurretTargeting = "Survivors")
{
Sleep 250
MouseMove, OnlySurvivorsX, OnlySurvivorsY, 1
Sleep 250
Send {Click}
Send {e up}
}
if(TurretTargeting = "S&T")
{
Sleep 250
MouseMove, SurvivorsTamesX, SurvivorsTamesY, 1
Sleep 250
Send {Click}
Send {e up}
}
if(TurretTargeting = "S&Mounted T")
{
Sleep 250
MouseMove, SurvivorsMountedX, SurvivorsMountedY, 1
Sleep 250
Send {Click}
Send {e up}
}
if(TurretTargeting = "Tames Only")
{
Sleep 250
MouseMove, TamesOnlyX, TamesOnlyY, 1
Sleep 250
Send {Click}
Send {e up}
}
if(TurretRange!= "DNT")
{
Sleep 250
Send {e down}
Sleep 250
MouseMove, TekTurretRangeX, TekTurretRangeY, 1
Sleep 250
Send {Click}
}
if(TurretRange = "Low")
{
Sleep 250
MouseMove, LowRangeX, LowRangeY, 1
Sleep 250
Send {Click}
Send {e up}
}
if(TurretRange = "Medium")
{
Sleep 250
MouseMove, MediumRangeX, MediumRangeY, 1
Sleep 250
Send {Click}
Send {e up}
}
if(TurretRange = "High")
{
Sleep 250
MouseMove, HighRangeX, HighRangeY, 1
Sleep 250
Send {Click}
Send {e up}
}
if(TurretName!= "DNT")
{
Sleep 250
Send {e down}
Sleep 250
MouseMove, RenameTekX, RenameTekY, 1
Sleep 250
Send {Click}
Send {e up}
MouseMove, RenameTextX, RenameTextY, 1
Sleep 250
Send {Click}
Send, %TurretName%
Send {Enter}
}
If(TurretPin!= "DNT")
{
Sleep 750
Send {e down}
Sleep 250
MouseMove, PinCodeX, PinCodeY, 1
Sleep 250
Send {Click}
Send {e up}
Sleep 500
Send, %TurretPin%
}
}
If(tHeavy)
{
if(PinSet==1)
{
Sleep 250
Send {e down}
Sleep 250
MouseMove, ClearPinX, ClearPinY, 1
Sleep 250
Send {Click}
Send {e up}
}
if(TurretTargeting != "DNT")
{
Sleep 250
Send {e down}
Sleep 250
MouseMove, HeavyTargetingX, HeavyTargetingY, 1
Sleep 250
Send {Click}
}
if(TurretTargeting = "Survivors")
{
Sleep 250
MouseMove, OnlySurvivorsX, OnlySurvivorsY, 1
Sleep 250
Send {Click}
Send {e up}
}
if(TurretTargeting = "S&T")
{
Sleep 250
MouseMove, SurvivorsTamesX, SurvivorsTamesY, 1
Sleep 250
Send {Click}
Send {e up}
}
if(TurretTargeting = "S&Mounted T")
{
Sleep 250
MouseMove, SurvivorsMountedX, SurvivorsMountedY, 1
Sleep 250
Send {Click}
Send {e up}
}
if(TurretTargeting = "Tames Only")
{
Sleep 250
MouseMove, TamesOnlyX, TamesOnlyY, 1
Sleep 250
Send {Click}
Send {e up}
}
if(TurretRange!= "DNT")
{
Sleep 250
Send {e down}
Sleep 250
MouseMove, HeavyTurretRangeX, HeavyTurretRangeY, 1
Sleep 250
Send {Click}
}
if(TurretRange = "Low")
{
Sleep 250
MouseMove, LowRangeX, LowRangeY, 1
Sleep 250
Send {Click}
Send {e up}
}
if(TurretRange = "Medium")
{
Sleep 250
MouseMove, MediumRangeX, MediumRangeY, 1
Sleep 250
Send {Click}
Send {e up}
}
if(TurretRange = "High")
{
Sleep 250
MouseMove, HighRangeX, HighRangeY, 1
Sleep 250
Send {Click}
Send {e up}
}
if(TurretName!= "DNT")
{
Sleep 250
Send {e down}
Sleep 250
MouseMove, RenameHeavyX, RenameHeavyY, 1
Sleep 250
Send {Click}
MouseMove, RenameTextX, RenameTextY, 1
Sleep 250
Send {Click}
Send, %TurretName%
Send {Enter}
Send {e up}
}
if(TurretPin!= "DNT")
{
Sleep 750
Send {e down}
Sleep 250
MouseMove, PinCodeX, PinCodeY, 1
Sleep 250
Send {Click}
Send {e up}
Sleep 500
Send, %TurretPin%
}
}
return
^x::ExitApp