#SingleInstance, force

;1920 x 1080
global searchBoxX := 1247
global searchBoxY := 197
global dropBoxX   := 1458
global dropBoxY   := 197
global randomNumberLowerBound := 100
global randomNumberUpperBound := 300

;2560 x 1440
; global searchBoxX := 1660
; global searchBoxY := 260
; global dropBoxX   := 1944
; global dropBoxY   := 260
; global randomNumberLowerBound := 100
; global randomNumberUpperBound := 300

; Msgbox, Mode: %1%
; mode := % 1
; for n, param in A_Args  ; For each parameter:
; {
;     MsgBox Parameter number %n% is %param%.
;     if (%param% == flint) {
;         MsgBox, FliNT FLINT FLINT
;     }
; }

global mode
for param in A_Args
{
    mode := %param%
}


; MsgBox, Mode: %mode%
; mode := "all"

; Generate a random sleep interval
switch % mode
{
    Case "all":
    ToolTip, Dropping All
    ; drop("sto")
    ; sleep, 150
    ; drop("fli")
    ; sleep, 150
    ; drop("woo")
    ; sleep, 150
    ; drop("tha")
    ; sleep, 150
    ; drop("ber")
    ; sleep, 150
    ; drop("see")

    Random, sleepRand, randomNumberLowerBound, randomNumberUpperBound
    Sleep, 400
    SendInput, { f }
    
    Sleep, %sleepRand%
    MouseMove, searchBoxX, searchBoxY, 1
    Sleep, %sleepRand%
    Click
    Sleep, %sleepRand%
    Send, sto
    Sleep, %sleepRand%
    MouseMove, dropBoxX, dropBoxY, 1
    Sleep, %sleepRand%
    Click

    Sleep, %sleepRand%
    MouseMove, searchBoxX, searchBoxY, 1
    Sleep, %sleepRand%
    Click
    Sleep, %sleepRand%
    Send, fli
    Sleep, %sleepRand%
    MouseMove, dropBoxX, dropBoxY, 1
    Sleep, %sleepRand%
    Click
    
    Sleep, %sleepRand%
    MouseMove, searchBoxX, searchBoxY, 1
    Sleep, %sleepRand%
    Click
    Sleep, %sleepRand%
    Send, woo
    Sleep, %sleepRand%
    MouseMove, dropBoxX, dropBoxY, 1
    Sleep, %sleepRand%
    Click

    Sleep, %sleepRand%
    MouseMove, searchBoxX, searchBoxY, 1
    Sleep, %sleepRand%
    Click
    Sleep, %sleepRand%
    Send, tha
    Sleep, %sleepRand%
    MouseMove, dropBoxX, dropBoxY, 1
    Sleep, %sleepRand%
    Click

    Sleep, %sleepRand%
    MouseMove, searchBoxX, searchBoxY, 1
    Sleep, %sleepRand%
    Click
    Sleep, %sleepRand%
    Send, ber
    Sleep, %sleepRand%
    MouseMove, dropBoxX, dropBoxY, 1
    Sleep, %sleepRand%
    Click

    Sleep, %sleepRand%
    MouseMove, searchBoxX, searchBoxY, 1
    Sleep, %sleepRand%
    Click
    Sleep, %sleepRand%
    Send, see
    Sleep, %sleepRand%
    MouseMove, dropBoxX, dropBoxY, 1
    Sleep, %sleepRand%
    Click
    
    SendInput, { f }
    return
    
    
    Case "stone":
    ToolTip, Dropping Stone
    drop("sto")
    return
    
    Case "flint":
    ToolTip, Dropping Flint
    drop("fli")
    return
    
    Case "wood":
    ToolTip, Dropping Wood
    drop("woo")
    return
    
    Case "thatch":
    ToolTip, Dropping Thatch
    drop("tha")
    return
    
    Case "berries":
    ToolTip, Dropping Berries
    drop("ber")
    return
    
    Case "seeds":
    ToolTip, Dropping Seeds
    drop("see")
    return
}

drop(resource) 
{
    Random, sleepRand, randomNumberLowerBound, randomNumberUpperBound
    Sleep, 150
    SendInput, { f }
    Sleep, %sleepRand%
    MouseMove, searchBoxX, searchBoxY, 1
    Sleep, %sleepRand%
    Click
    Sleep, %sleepRand%
    Send, %resource%
    Sleep, %sleepRand%
    MouseMove, dropBoxX, dropBoxY, 1
    Sleep, %sleepRand%
    Click
    Sleep, %sleepRand%
    SendInput, { f }
}

return

Esc::
ExitApp
return