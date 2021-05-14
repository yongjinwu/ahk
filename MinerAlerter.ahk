#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



Folder=C:\Users\Yong\Desktop\PhoenixMiner_5.4c_Windows_AMD_NVIDIA.Password-phoenix\PhoenixMiner_5.4c_Windows_AMD_NVIDIA (Password-phoenix)
getlastfolder(folder, file)



getlastfolder(byref Folder,byref file="")
	{
	Loop, %Folder%\*
		{
		FileGetTime, Time, %A_LoopFileFullPath%, C
		If (Time > Time_Orig)
			{
			Time_Orig := Time
			File := A_LoopFileName
			}
		}
	}
;#######################################################################









Loop
{

Loop, read, %folder%/%file%
{
	LastLine := A_LoopReadLine
}



If InStr(LastLine, "Invalid")
    {
	Run, firefox.exe -new-window https://mail.google.com/

	waitforpageload1: 
		Loop
		{	
		ImageSearch, FoundX, FoundY, 0, 0, 200, 200, C:\Users\Yong\Documents\emailready.png
		If ErrorLevel = 0
			break waitforpageload1
		}
	sleep 5000
	MouseClick,,122,274
	sleep 1000
	Send yong.1390
	sleep 500
	Send {Down}
	sleep 500
	Send {Enter}
	sleep 500
	MouseClick,,2932,2069
	sleep 500
	Send {Enter}
	ExitApp
    }
Else
    {
	

     }

}