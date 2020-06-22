
Local $iMax

Local $data = "https://web.whatsapp.com/|https://open.spotify.com/|https://github.com/ailtonz/Training_Java"

; The string in data will be split into an array everywhere | is encountered
Local $arr = StringSplit($data, "|")

If IsArray($arr) Then
    For $i = 1 to $arr[0]
	  ConsoleWrite($arr[$i] & @LF)
	  ShellExecute($arr[$i])
    Next
EndIf