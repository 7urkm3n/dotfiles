GroupAdd, Gaming, ahk_exe dota2.exe
GroupAdd, Gaming, ahk_exe csgo.exe
GroupAdd, Gaming, ahk_exe cs2.exe

#IfWinNotActive ahk_group Gaming
    Capslock::Esc
#IfWinNotActive

#IfWinActive ahk_group Gaming
    Capslock::
#IfWinActive
