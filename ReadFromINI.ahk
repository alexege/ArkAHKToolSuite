
#SingleInstance, force
; Function to read settings from the INI file

global vUsername
global vFontSize
global vTheme

ReadSettings() {
    
    iniFile = %A_ScriptDir%\settings.ini

    ; Read settings from the INI file
    IniRead, vUsername, %iniFile%, Settings, Username
    IniRead, vFontSize, %iniFile%, Settings, FontSize
    IniRead, vTheme, %iniFile%, Settings, Theme

    MsgBox, %vUsername%
}

; Read settings from the INI file
ReadSettings()

; Create GUI
Gui, Add, Text, , Username:
Gui, Add, Edit, vUsername, %vUsername%
Gui, Add, Text, , Font Size:
Gui, Add, Edit, vFontSize, %vFontSize%
Gui, Add, Text, , Theme:
Gui, Add, DropDownList, vTheme, Light|Dark
Gui, Add, Button, Default gSaveSettings, Save Settings

; Set default values for GUI controls
GuiControl, Choose, %Theme%, Dark

; Show GUI
Gui, Show,, Settings
return

SaveSettings:
    ; Read values from GUI controls
    GuiControlGet, NewUsername, , Username
    GuiControlGet, NewFontSize, , FontSize
    GuiControlGet, NewTheme, , Theme

    ; Update settings in the INI file
    IniWrite, %NewUsername%, %iniFile%, Settings.ini, Username
    IniWrite, %NewFontSize%, %iniFile%, Settings.ini, FontSize
    IniWrite, %NewTheme%, %iniFile%, Settings.ini, Theme

    ; Update the settings in memory
    Username := NewUsername
    FontSize := NewFontSize
    Theme := NewTheme

    ; Close the GUI
    GuiClose:
        Gui, Destroy
    return
