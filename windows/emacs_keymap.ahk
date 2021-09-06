#InstallKeybdHook
#UseHook

; 除外設定
SetTitleMatchMode,  2
GroupAdd, exclusion, ahk_exe emacs.exe
GroupAdd, exclusion, ahk_exe Code.exe
GroupAdd, exclusion, ahk_exe kali.exe
GroupAdd, exclusion, ahk_exe ubuntu2004.exe

#IfWinNotActive ahk_group exclusion

^f::Send, {Right}
^p::Send, {Up}
^n::Send, {Down}
^b::Send, {Left}

^d::Send, {Delete}
^h::Send, {BS}
^a::Send, {HOME}
^e::Send, {End}
^k::Send, {Shift Down}{End}{Shift Up}{Backspace}

LWin & c::Send, ^c
LWin & v::Send, ^v
LWin & s::Send, ^s
LWin & z::Send, ^z
LWin & f::Send, ^f
LWin & a::Send, ^a
LWin & w::Send, ^w
LWin & Space::Send, #s
LWin & /::Send, #v
#+4::Send, #+s

#IfWinNotActive ahk_group exclusion