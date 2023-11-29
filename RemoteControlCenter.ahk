#SingleInstance, force
;What progrma should this script act on?
ActiveProgram := "Notepad"
; Default Status Variables
global currentAction := "none"
global previousAction := "rand"
; Search Box Variables
global searchBoxX := 1247
global searchBoxY := 197
; Drop Resources Variables
global dropBoxX  := 1458
global dropBoxY  := 197
global activeDropList ; Is this in use anywhere?
global randomNumberLowerBound := 100
global randomNumberUpperBound := 300
CoordMode, Mouse, Screen ;Make sure coords are relative to screen
DetectHiddenWindows, On
; Custom settings saved to Config.ini
configFile = %A_ScriptDir%\config.ini
if !FileExist(configFile) {
  
  ; Create a new config.ini file and populate it with the defaults
  Fileappend,, config.ini
  SysGet, vMonWidth, 0
  SysGet, vMonHeight, 1
  ; ChatBox
  if (vMonWidth == 2560 && vMonHeight == 1440) {
    ; ChatBox Defaults
    IniWrite, 50, %configFile%, ChatBox, x_start
    IniWrite, 1300, %configFile%, ChatBox, y_start
    IniWrite, 630, %configFile%, ChatBox, x_end
    IniWrite, 1340, %configFile%, ChatBox, y_end
    
    ; SearchBox Defaults
    IniWrite, 1247, %configFile%, SearchBox, searchBoxX
    IniWrite, 197, %configFile%, SearchBox, searchBoxY
  
    ; DropBox Defaults
    IniWrite, 1458 ,%configFile%, DropBox, dropBoxX
    IniWrite, 197 ,%configFile%, DropBox, dropBoxY
      
  } else if (vMonWidth == 1920 && vMonHeight == 1080) {
    ; ChatBox Defaults
    IniWrite, 36, %configFile%, ChatBox, x_start
    IniWrite, 981, %configFile%, ChatBox, y_start
    IniWrite, 523, %configFile%, ChatBox, x_end
    IniWrite, 1000, %configFile%, ChatBox, y_end
    
    ; SearchBox Defaults
    IniWrite, 1247, %configFile%, SearchBox, searchBoxX ;Defaults Need Updating fro 1080p
    IniWrite, 197, %configFile%, SearchBox, searchBoxY ;Defaults Need Updating fro 1080p
  
    ; DropBox Defaults
    IniWrite, 1458 ,%configFile%, DropBox, dropBoxX ;Defaults Need Updating fro 1080p
    IniWrite, 197 ,%configFile%, DropBox, dropBoxY ;Defaults Need Updating fro 1080p
  }
  ; Default Variables that are independent to Screen Size
  IniWrite, 1, %configFile%, Highlight, Visible
}
; Read in New Values
IniRead, x_start, %configFile%, ChatBox, x_start
IniRead, y_start, %configFile%, ChatBox, y_start
IniRead, x_end, %configFile%, ChatBox, x_end
IniRead, y_end, %configFile%, ChatBox, y_end
IniRead, searchBoxX, %configFile%, SearchBox, searchBoxX
IniRead, searchBoxY, %configFile%, SearchBox, searchBoxY 
IniRead, dropBoxX, %configFile%, DropBox, dropBoxX
IniRead, dropBoxY, %configFile%, DropBox, dropBoxY
IniRead, showOutline, %configFile%, Highlight, Visible
; Draw Default Highlighters
if (showOutline) {
  Highlight(x_start, y_start, 630, 40) ; startX startY, offsetX, offsetY
  HighlightSearch(searchBoxX - 20, searchBoxY - 20, 40, 40)
  HighlightDrop(dropBoxX - 20, dropBoxY - 20, 40, 40)   
}
; Status Gui
Gui, status:+AlwaysOnTop -Label -Caption -MaximizeBox -Theme
Gui, status:Font, +cWhite s7
Gui, status:Color, black
Gui, status:Add, Text, xp+25 yp+3 vStatusMessage, Status: Stopped
Gui, status:Add, Text, xp yp+14 w85 vActionMessage, Action: None
Gui, status:Add, Progress, vbar1  x5 y5  w20 h20
GuiControl, status:+BackgroundRed, bar1
Gui, status:Show, x0 y0
; Splash Screen
SysGet, sizeframe, 33
SysGet, cyborder, 8
Gui, splash:+AlwaysOnTop -Caption
Gui, splash:Color, black
Gui, splash:Font, +cLime s7
Gui, splash:Add, Text, Center w140 yp+5, AHK Ark Tool Suite Script
Gui, splash:Font, +cWhite underline
Gui, splash:Add, Text, w140 yp+15, Hotkey `t Action
Gui, splash:Font, normal
Gui, splash:Add, Text, yp+15, F1 `t Start/Stop Script `nF2 `t Pause Script `nF3 `t SetCoords `nF4 `t Settings`nEsc `t Exit Script 
Gui, splash:Show
Return
splashGuisize:
  guiheight := A_guiheight
  guiwidth := A_guiwidth
  Gui, splash:Show, % "x" A_ScreenWidth / 2 - GuiWidth / 2 - sizeframe / 2 - cyborder " y" cyborder " w" Guiwidth " h" GuiHeight
return
F1::
If WinExist("ahk_class" ActiveProgram){
  IfWinActive ahk_class %ActiveProgram% 
  {
    Run, %A_ScriptDir%\Swing.ahk
  }
}
return
F2::
If WinExist("ahk_class" ActiveProgram){
  IfWinActive ahk_class %ActiveProgram% 
  {
    Run, %A_ScriptDir%\DropResources.ahk
  }
}
return
; *F2::
; StopScript:
;   GuiControl, status:+BackgroundRed, bar1
;   GuiControl, status:,StatusMessage, Status: Paused
; Suspend
; return
F3::
; toggle := toggle
; if(toggle) {
;   Gui, screenSettings:Destroy
;   return
; }
Gui, screenSettings:Color, black
Gui, screenSettings:Font, +cBlack
Gui, screenSettings:+AlwaysOnTop +ToolWindow
Gui, screenSettings:Font, +cWhite
Gui, screenSettings:Add, GroupBox, xm ym w160 h66 Section, Search Box Coords
Gui, screenSettings:Font, +cBlack
Gui, screenSettings:Add, Edit,vSearchBoxX w50 xs+5 ys+15
Gui, screenSettings:Add, Edit,vSearchBoxY w50 xs+55 ys+15
Gui, screenSettings:Add, Button, vSearchBoxCoords gSetSearchBoxCoords xs+110 ys+15 w45 h46, Set Position
Gui, screenSettings:Add, Button, gTestSearchBoxCoods xs+5 ys+40 w100 h21, Test
Gui, screenSettings:Font, +cWhite
Gui, screenSettings:Add, GroupBox, xm ym+70 w160 h66 Section, Drop Box Coords
Gui, screenSettings:Font, +cBlack
Gui, screenSettings:Add, Edit,vDropBoxX w50 xs+5 ys+15
Gui, screenSettings:Add, Edit,vDropBoxY w50 xs+55 ys+15
Gui, screenSettings:Add, Button, vDropBoxCoords gSetDropBoxCoords xs+110 ys+15 w45 h46, Set Position
Gui, screenSettings:Add, Button, gTestDropBoxCoords xs+5 ys+40 w100 h21, Test
Gui, screenSettings:Add, Button, xm gSaveCoords Center w160, Save
Gui, screenSettings:Show,, Manually Set Coordinates
GuiControl, screenSettings:, searchBoxX, %SearchBoxX%
GuiControl, screenSettings:, searchBoxY, %SearchBoxY%
GuiControl, screenSettings:, dropBoxX, %DropBoxX%
GuiControl, screenSettings:, dropBoxY, %DropBoxY%
toggle := !toggle
if(toggle){
  SetTimer, showCoords, 10
} else {
  SetTimer, showCoords, Off
  ToolTip,, ;Clear Tooltip
}
return
SaveCoords:
  Gui, screenSettings: Destroy
  SetTimer, showCoords, Off
  ToolTip,,
  
  ;SearchBox
  IniWrite, %searchBoxX%, %configFile%, SearchBox, searchBoxX
  IniWrite, %searchBoxY%, %configFile%, SearchBox, searchBoxY
  ; DropBox
  IniWrite, %dropBoxX% ,%configFile%, DropBox, dropBoxX
  IniWrite, %dropBoxY% ,%configFile%, DropBox, dropBoxY
return
showCoords:
 MouseGetPos, x, y
 tooltip, x: %x%`, y: %y%
return
TestSearchBoxCoods() {
  CoordMode, Mouse, Screen ;Make sure coords are relative to screen
  GuiControlGet, SearchBoxX
  GuiControlGet, SearchBoxY
  MouseMove, %SearchBoxX%, %SearchBoxY%, R
}
TestDropBoxCoords() {
  CoordMode, Mouse, Screen ;Make sure coords are relative to screen
  GuiControlGet, DropBoxX
  GuiControlGet, DRopBoxY
  MouseMove, %DropBoxX%, %DropBoxY%, R
}
SetSearchBoxCoords() {
  GuiControl,, SearchBoxCoords, Click To Set 
  ToolTip, click to set coordinates of search box ;Overwritten by mouse x/y tooltip
  KeyWait, LButton, D
  MouseGetPos, sX1, sY1
  KeyWait, LButton, U
  ToolTip
  GuiControl, screenSettings:, SearchBoxX, %sX1%
  GuiControl, screenSettings:, SearchBoxY, %sY1%
  GuiControlGet, SearchBoxX
  GuiControlGet, SearchBoxY
  HighlightSearch(SearchBoxX - 20, SearchBoxY - 20, 40, 40)
  GuiControl,, SearchBoxCoords, Position Set (✓)
}
SetDropBoxCoords() {
  GuiControl,, DropBoxCoords, Click To Set
  ToolTip, click to set coordinates of drop box ;Overwritten by mouse x/y tooltip
  KeyWait, LButton, D
  MouseGetPos, X1, Y1
  KeyWait, LButton, U
  ToolTip
  GuiControl, screenSettings:, DropBoxX, %X1%
  GuiControl, screenSettings:, DropBoxY, %Y1%
  
  GuiControlGet, DropBoxX
  GuiControlGet, DropBoxY
  HighlightDrop(DropBoxX - 20, DropBoxY - 20, 40, 40)
  GuiControl,, DropBoxCoords, Set Pos (✓)
}
F4::
ShowSettings:
toggle := !toggle
if(!toggle) {
  Gui help:Destroy
  Gui settings:Destroy
  return
}
Gui settings:+AlwaysOnTop -Resize -Theme +ToolWindow
Gui settings:Font, +cWhite
Gui settings:Color, black
Gui settings:Add, GroupBox, xm ym Section w165 h80, Farming Presets
Gui settings:Add, Button, xs+10 ys+20 w45 gdropItems_metal, Metal
Gui settings:Add, Button, xs+60 ys+20  w45 gdropItems_stone, Stone
Gui settings:Add, Button, xs+110 ys+20 w45 vAllOrNone gdropItems_all, All
Gui settings:Add, Button, xs+10 ys+50 w45 gdropItems_wood, Wood
Gui settings:Add, Button, xs+60 ys+50 w45 gdropItems_crystal, Crystal
Gui settings:Add, Button, xs+110 ys+50 w45 gdropItems_obsidian, Obsid
Gui settings:Add, GroupBox, xm ym+80 r6 Section w165, Custom Drop List
Gui settings:Add, CheckBox, xs+10 ys+20 vBerry Checked,Berries
Gui settings:Add, CheckBox, vChitin Checked,Chitin
Gui settings:Add, CheckBox, vCrystal Checked, Crystal
Gui settings:Add, CheckBox, vFiber Checked, Fiber
Gui settings:Add, CheckBox, vFlint Checked, Flint
Gui settings:Add, CheckBox, vHide Checked, Hide
Gui settings:Add, CheckBox, xs+70 ys+20 vMetal, Metal
Gui settings:Add, CheckBox, vObsidian Checked, Obsidian
Gui settings:Add, CheckBox, vRaw, Raw
Gui settings:Add, CheckBox, vStone Checked, Stone
Gui settings:Add, CheckBox, vThatch Checked, Thatch
Gui settings:Add, CheckBox, vWood Checked, Wood
Gui settings:Add, Button, xm ym+220 w165 Center gSaveItemsToDrop, Save
Gui settings:Show,, What resource to drop?
return
dropItems_metal(){
  GuiControl,, Berry, 1
  GuiControl,, Chitin,1
  GuiControl,, Crystal,1
  GuiControl,, Fiber,1
  GuiControl,, Flint,1
  GuiControl,, Hide,1
  GuiControl,, Metal,0
  GuiControl,, Obsidian,1
  GuiControl,, Raw,1
  GuiControl,, Stone,1
  GuiControl,, Thatch,1
  GuiControl,, Wood,1
}
dropItems_stone(){
  GuiControl,, Berry, 1
  GuiControl,, Chitin,1
  GuiControl,, Crystal,1
  GuiControl,, Fiber,1
  GuiControl,, Flint,0
  GuiControl,, Hide,1
  GuiControl,, Metal,1
  GuiControl,, Obsidian,1
  GuiControl,, Raw,1
  GuiControl,, Stone,0
  GuiControl,, Thatch,1
  GuiControl,, Wood,1
}
dropItems_crystal(){
  GuiControl,, Berry, 1
  GuiControl,, Chitin,1
  GuiControl,, Crystal,0
  GuiControl,, Fiber,1
  GuiControl,, Flint,1
  GuiControl,, Hide,1
  GuiControl,, Metal,1
  GuiControl,, Obsidian,1
  GuiControl,, Raw,1
  GuiControl,, Stone,1
  GuiControl,, Thatch,1
  GuiControl,, Wood,1
}
dropItems_wood(){
  GuiControl,, Berry, 1
  GuiControl,, Chitin,1
  GuiControl,, Crystal,1
  GuiControl,, Fiber,1
  GuiControl,, Flint,1
  GuiControl,, Hide,1
  GuiControl,, Metal,1
  GuiControl,, Obsidian,1
  GuiControl,, Raw,1
  GuiControl,, Stone,1
  GuiControl,, Thatch,1
  GuiControl,, Wood,0
}
dropItems_obsidian(){
  GuiControl,, Berry, 1
  GuiControl,, Chitin,1
  GuiControl,, Crystal,1
  GuiControl,, Fiber,1
  GuiControl,, Flint,1
  GuiControl,, Hide,1
  GuiControl,, Metal,1
  GuiControl,, Obsidian,0
  GuiControl,, Raw,1
  GuiControl,, Stone,1
  GuiControl,, Thatch,1
  GuiControl,, Wood,1
}
dropItems_fiber(){
  GuiControl,, Berry, 1
  GuiControl,, Chitin,1
  GuiControl,, Crystal,1
  GuiControl,, Fiber,1
  GuiControl,, Flint,1
  GuiControl,, Hide,1
  GuiControl,, Metal,1
  GuiControl,, Obsidian,0
  GuiControl,, Raw,1
  GuiControl,, Stone,1
  GuiControl,, Thatch,1
  GuiControl,, Wood,1
}
dropItems_all(){
  static toggle := false
  toggle := !toggle
  if(toggle) {
    GuiControl,,   AllOrNone, None
    GuiControl,,   Berry,    1
    GuiControl,,   Chitin,   1
    GuiControl,,   Crystal,   1
    GuiControl,,   Fiber,    1
    GuiControl,,   Flint,    1
    GuiControl,,   Hide,    1
    GuiControl,,   Metal,    1
    GuiControl,,   Obsidian,  1
    GuiControl,,   Raw,     1
    GuiControl,,   Stone,    1
    GuiControl,,   Thatch,   1
    GuiControl,,   Wood,    1
  } else {
    GuiControl,,   AllOrNone, All
    GuiControl,,   Berry,    0
    GuiControl,,   Chitin,   0
    GuiControl,,   Crystal,   0
    GuiControl,,   Fiber,    0
    GuiControl,,   Flint,    0
    GuiControl,,   Hide,    0
    GuiControl,,   Metal,    0
    GuiControl,,   Obsidian,  0
    GuiControl,,   Raw,     0
    GuiControl,,   Stone,    0
    GuiControl,,   Thatch,   0
    GuiControl,,   Wood,    0
  }
}
SaveItemsToDrop()
{
  ToolTip, Saving list of items to drop...
  Sleep, 3000
  ToolTip,,
  Gui, settings:Submit, NoHide
  GuiControlGet, Berry
  GuiControlGet, Chitin
  GuiControlGet, Crystal
  GuiControlGet, Flint
  GuiControlGet, Hide
  GuiControlGet, Metal
  GuiControlGet, Obsidian
  GuiControlGet, Stone
  GuiControlGet, Thatch
  GuiControlGet, Wood
  GuiControlGet, Raw
  dropList := [Berry, Chitin, Crystal, Flint, Hide, Metal, Obsidian, Stone, Thatch, Wood, Raw]
  dropListNames := ["Berry", "Chitin", "Crystal", "Flint", "Hide", "Metal", "Obsidian", "Stone", "Thatch", "Wood", "Raw"]
  dropListActive := []
  for i, item in dropList
  {
    if (dropList[item] = 1)
    {
      ; MsgBox, % dropList[item]
      dropListActive.push(dropListNames[i])
    }
  }
  for j in dropListActive
  {
    ; MsgBox, % dropListActive[j]
    drop(dropListActive[j])
  }
  activeDropList := % join(dropListActive)
}
join(strArray)
{
s := ""
for i,v in strArray
  s .= ", " . v
return substr(s, 11)
}
drop(activeDropList)
drop(resource)
{
  
  Random, sleepRand, randomNumberLowerBound, randomNumberUpperBound
  ; Run, %A_ScriptDir%\DropResources.ahk %item%
  ; SendInput, { f }
  Sleep, sleepRand
  ; MouseMove, searchBoxX, searchBoxyY, 1
  Sleep, sleepRand
  Click
  Sleep, sleepRand
  Send, %resource%
  Sleep, sleepRand
  ; MouseMove, dropBoxX, dropBoxY, 1
  Sleep, sleepRand
  Click
  Sleep, sleepRand
  ; SendInput, { f }
}
~*^s::
Reload
return
$*F5::
StartScript:
IfWinActive ahk_class Notepad 
{
; ; Toggle Gamma Values
; WinActivate ahk_class UnrealWindow
; toggle := !toggle
; if(toggle) {
;   Send, {`}
;   Sleep, 300
;   SendInput, gamma -10
;   Sleep, 300
;   SendInput, {Enter}
; } else {
;   Send, {`}
;   Sleep, 300
;   SendInput, gamma
;   Sleep, 300
;   SendInput, {Enter}
; }
GuiControl, status:+BackgroundLime, bar1
GuiControl, status:,StatusMessage, Status: Running
; If Ark is open, Make it the active window
If WinExist(ahk_class UnrealWindow){
  WinActivate, ahk_class UnrealWindow
}
; Start a timer that triggers every second (Tick)
SetTimer, Tick, 1000
Tick() {
  SendInput, { PgDn } ;Force chat window to popup
  
  ; Searches bounds and copies converted string to clipboard
  ; RunWait, %A_ScriptDir%\Capture2Text\Capture2Text.exe %x_start% %y_start% %x_end% %y_end%
  ; Determine what the currentAction is. (Parse clipboard text)
  for each, keyword in ["!swing", "!swi", "!sw", "!s", "!start", "!click"] {
    if(InStr(clipboard, keyword)){
      currentAction := "!swing"
      break
    }
  }
  for each, keyword in ["!drop", "!dro", "!dr", "!d"] {
    if(InStr(clipboard, keyword)){
      currentAction := "!drop"
      break
    }
  }
  for each, keyword in ["!stop", "!sto", "!st"] {
    if(InStr(clipboard, keyword)){
      currentAction := "!stop"
      break
    }
  }
  for each, keyword in ["!mount", "!mou", "!mo", "!m"] {
    if(InStr(clipboard, keyword)){
      currentAction := "!mount"
      break
    }
  }
  for each, keyword in ["!dismount", "!dis", "!dm", "!di"] {
    if(InStr(clipboard, keyword)){
      currentAction := "!dismount"
      break
    }
  }
  for each, keyword in ["!respawn", "!res", "!rs", "!r"] {
    if(InStr(clipboard, keyword)){
      currentAction := "!respawn"
      break
    }
  }
  for each, keyword in ["!eat", "!ea", "!e", "!drink", "!dri"] {
    if(InStr(clipboard, keyword)){
      currentAction := "!eat"
      break
    }
  }
  ToolTip, %currentAction%
  
  ; Update Gui to show current running action
  GuiControl, status:, ActionMessage, Action: %currentAction%
  ; We only want to update the action if the new action changes
  if (previousAction != currentAction)
    {
      WinClose, %A_ScriptDir%\Swing.ahk ahk_class AutoHotkey
      ; Change action
      if (currentAction == "!swing") {
        Tooltip, Swinging
        GuiControl, status:,ActionMessage, Action: Swinging
        ; Run, %A_ScriptDir%\Swing.ahk
        ; SendInput, Swinging
      }
      
      if (currentAction == "!stop") {
        Tooltip, Stopping
        GuiControl, status:,ActionMessage, Action: Stopping
        ; WinClose, %A_ScriptDir%\Swing.ahk ahk_class AutoHotkey
        ; SendInput, Stopping
      }
      
      if (currentAction == "!drop") {
        Tooltip, Dropping
        GuiControl, status:,ActionMessage, Action: Dropping
        ; Run, %A_ScriptDir%\DropResources.ahk all
        ; SendInput, Dropping
      }
      
      if (currentAction == "!eat" || currentAction == "!drink") {
        GuiControl, status:,ActionMessage, Action: Eating
        ; Tooltip, Eating/Drinking
        ; SendInput, { 9 }
        ; SendInput, { 9 }
        ; SendInput, { 9 }
        ; SendInput, { 9 }
        ; SendInput, { 0 }
        ; SendInput, Eating
      }
      if (currentAction == "!dismount" || currentAction == "!mount") {
        ; SendInput { e }
        GuiControl, status:,ActionMessage, Action: Mounting
        ; SendInput, Dismounting
      }
      
      if (currentAction == "!dismount") {
        ; SendInput { e }
        GuiControl, status:,ActionMessage, Action: Dismounting
        ; SendInput, Dismounting
      }
      
      if (currentAction == "!respawn") {
        ; SendInput { e }
        GuiControl, status:,ActionMessage, Action: Respawning
        ; SendInput, Respawning
      }
      ; Tooltip, % "Different: " previousAction currentAction
      
      ; Have user type in chat to let user know action was received
      SendInput { Insert }
      Sleep, 150
      Send, .
      Sleep, 150
      Send, {Enter}
      
      ; Update previous Action
      previousAction := currentAction
    }
}
} else {
  MsgBox, Ark was not detected. Please make sure it is running before trying again.
}
return
;Highlight the Dino's Inventory Search Box in red
HighlightSearch(x,y,w,h){
  Gui, HighlightSearch:Destroy
  Gui, HighlightSearch:+AlwaysOnTop -Caption +LastFound +ToolWindow +E0x20
  WinSet , Transcolor , 123456 175
  Gui, HighlightSearch:Color,ff0000
  Gui, HighlightSearch:Add,Progress,x5 y5 w%w% h%h% Background123456
  Gui, HighlightSearch:Show,% "x" x-5 " y" y-5 " w" w+10 " h" h+10 NA,
}
return
;Highlight the Drop All Box in the Dino's Inventory in red
HighlightDrop(x,y,w,h){
  Gui, HighlightDrop:Destroy
  Gui, HighlightDrop:+AlwaysOnTop -Caption +LastFound +ToolWindow +E0x20
  WinSet , Transcolor , 123456 175
  Gui, HighlightDrop:Color,ff0000
  Gui, HighlightDrop:Add,Progress,x5 y5 w%w% h%h% Background123456
  Gui, HighlightDrop:Show,% "x" x-5 " y" y-5 " w" w+10 " h" h+10 NA,
}
return
;Highlight the box around the chat box in red
Highlight(x,y,w,h){
  Gui, Highlight:Destroy
  Gui, Highlight:+AlwaysOnTop -Caption +LastFound +ToolWindow +E0x20
  WinSet , Transcolor , 123456 175
  Gui, Highlight:Color,ff0000
  Gui, Highlight:Add,Progress,x5 y5 w%w% h%h% Background123456
  Gui, Highlight:Show,% "x" x-5 " y" y-5 " w" w+10 " h" h+10 NA,
}
return 
; AutoRun
~*RCtrl::
If(AutoRunEnable = -1) {
  ControlSend, ahk_parent, {w down}, ArkAscended
} else {
  ControlSend, ahk_parent, {w up}, ArkAscended
  AutoRunEnable*=-1
}
return
; AutoSprint
~*RShift::
If(AutoSprintEnable = -1) {
  ControlSend, ahk_parent, {LShift down}, ArkAscended
} else {
  ControlSend, ahk_parent, {LShift up}, ArkAscended
  AutoSprintEnable*=-1
}
return
^ESC::
Reload
return
Esc::
QuitScript:
MsgBox 4, Confirm, Really Exit?
IfMsgBox, No
  Return
ExitApp 
return