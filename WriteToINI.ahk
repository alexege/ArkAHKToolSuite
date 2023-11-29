#SingleInstance, force

iniFile = %A_ScriptDir%\settings.ini
msg := "Zander"
Iniwrite, %msg%, settings.ini, Settings, Username

; IniRead, OutputVar, Filename, Section, Key , Default
IniRead, usrname, settings.ini, Settings, Username
MsgBox, This my usrnmae: %usrname%