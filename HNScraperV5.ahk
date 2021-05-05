#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

waitforpageload1: 
Loop
{
ImageSearch, FoundX, FoundY, 0, 0, 200, 100, C:\Users\Yong\Documents\refresh.png
If ErrorLevel = 0
	break waitforpageload1
}

Click, 638, 218, Left,Down
sleep 300

imageSearchStart:
Loop
{
ImageSearch, FoundX, FoundY, 282, 190, 849, 360, C:\Users\Yong\Documents\artist.png
If ErrorLevel = 0
{	
MouseMove,FoundX,FoundY-10
sleep 100
Click, FoundX, FoundY-10, Left,Up
sleep 100
Send ^c
Sleep, 100
seriesName :=clipboard
break imageSearchStart
}
}


clipboard := StrReplace(clipboard, "`t")
clipboard := StrReplace(clipboard, "`r")
clipboard := StrReplace(clipboard, "`n")
clipboard := StrReplace(clipboard, "?")
clipboard := StrReplace(clipboard, "*")
clipboard := StrReplace(clipboard, "/")
clipboard := StrReplace(clipboard, "\")
clipboard := StrReplace(clipboard, ".")
clipboard := StrReplace(clipboard, ":")
clipboard := StrReplace(clipboard, "<")
clipboard := StrReplace(clipboard, ">")
clipboard := StrReplace(clipboard, "|")
seriesName:=clipboard
path:= "C:\Users\Yong\Desktop\" clipboard "\Chapter"

FileCreateDir, %path%
clipboard:=path











ImageSearch, FoundX, FoundY, 0, 0, 1800, 1000, C:\Users\Yong\Documents\artist.png
If ErrorLevel = 0
{	
	Click,%FoundX%,%FoundY%,Left,Down
	
	ImageSearch, FoundX, FoundY, 0, 0, 1800, 1000, C:\Users\Yong\Documents\book.png
	If ErrorLevel = 0
		MouseMove,FoundX,FoundY-10
		sleep 100
		Send ^c
		Sleep, 100
		Click,,,Left,Up
	
}		
jsonTxt:="{`r`t""title"": ""Example Title"",`r`t""author"": ""Example Author"",`r`t""artist"": ""Example Artist"",`r`t""description"": ""Example Description"",`r`t""genre"": [Example Genre],`r`t""status"": ""2"",`r`t""_status values"": [""0 = Unknown"", ""1 = Ongoing"", ""2 = Completed"", ""3 = Licensed""]`r}"
vText := clipboard
lineCount:=8
Arr := StrSplit(vText, "`n")
artistName:= % Arr[1]
StringReplace, artistName, artistName, `n, , All
StringReplace, artistName, artistName, %A_TAB%, , All
StringReplace , artistName, artistName, `r,,All
StringTrimLeft, artistName, artistName,7
jsonTxt:= StrReplace(jsonTxt, "Example Author",artistName)
jsonTxt:= StrReplace(jsonTxt, "Example Artist",artistName)
jsonTxt:= StrReplace(jsonTxt, "Example Title",seriesName)


testWord:= "Description"
loop1:
Loop
{

testvar2:= % Arr[lineCount]
StringReplace, testvar2, testvar2, `n, , All
StringReplace, testvar2, testvar2, %A_TAB%, , All
StringReplace , testvar2, testvar2, `r,,All





testvar= "%testvar2%"
genreList.=testvar
genreList.=", "



lineCount:=lineCount+1

if InStr(testvar2,testWord)
{
genreList:= StrReplace(genreList,testvar2,"a")
StringTrimRight, genreList, genreList,7
break loop1
}



if (lineCount >= Arr.MaxIndex())
{

testvar2:=""
break loop1
}




}



jsonTxt:= StrReplace(jsonTxt, "Example Genre",genreList)
StringTrimLeft, testvar2, testvar2,12

StringReplace, testvar2, testvar2,",,All
jsonTxt:= StrReplace(jsonTxt, "Example Description",testvar2)









StringTrimRight,newpath,path,8




FileAppend,%jsonTxt%,%newpath%\details.json






















clipboard:=path






sleep 100

read:
Loop
{

ImageSearch, FoundX, FoundY, 282, 190, 1800, 1000, C:\Users\Yong\Documents\readbutton.png
If ErrorLevel = 0
{
MouseClick,,FoundX,FoundY
break read
}

}



sleep 1000
waitforpageload: 
Loop
{
ImageSearch, FoundX, FoundY, 0, 0, 200, 100, C:\Users\Yong\Documents\refresh.png
If ErrorLevel = 0
	break waitforpageload
}



Click, 861, 566 Right, Down
Sleep, 141
Click, 861, 566 Right, Up
Sleep, 234
Click, 946, 796 Left, Down
Sleep, 125
Click, 946, 796 Left, Up
Sleep, 400


Click,488,51
sleep 300
SendInput {Ctrl Down}{v Down}
Sleep 100
SendInput {v Up}{Ctrl Up}
sleep 1000
Send, {enter}
sleep 500
Click,660,490


sleep 400
Send, {Right Down}
Sleep, 94
Send, {Right Up}





sleep 500
WinGetTitle, Title, A
digitpos:=1
pagenumloop:
Loop
{
temp := SubStr(Title,4,digitpos)
if temp is integer
{
pageCount := temp
digitpos:=digitpos+1
}
else
{
break pagenumloop
}

}

pageCount :=pageCount - 1

loop, %pageCount% {
  

Sleep, 333
Sleep, 312
Click, 861, 566 Right, Down
Sleep, 141
Click, 861, 566 Right, Up
Sleep, 234
Click, 946, 796 Left, Down
Sleep, 125
Click, 946, 796 Left, Up


WinWaitActive, Save Image
Send, {enter}
inner: 
Loop
{

Sleep, 438
IfWinActive, Save Image
	Send, {enter}
else
	break inner

}
Send, {Right Down}
Sleep, 94
Send, {Right Up}
Sleep, 200

}


ExitApp

F2::Pause