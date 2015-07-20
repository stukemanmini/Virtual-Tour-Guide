#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.12.0
 Author:         Shawn Sandberg & Justin Stucki

 Script Function:
	Virtual Tour Guide control program

#ce ----------------------------------------------------------------------------

#include <GUIConstantsEx.au3>
#include <GUIButton.au3>
#include <ButtonConstants.au3>
#include <Misc.au3>
#include <Constants.au3>
#include <MsgBoxConstants.au3>
#RequireAdmin

#cs ----------------------------------------------------------------------------
Function Execution Order
#ce ----------------------------------------------------------------------------
;InitiationPrompt()
BlockInput(1) ;Blocks the users input
ChangeMouse()
OpenPointerFocus()
BlockInput(0) ; Unblocks the users Input
WhiteScreenButtons()

#cs ----------------------------------------------------------------------------
Initiation Prompt
Prompts the user to continue executing the program.
The program requires a bit of time to fully startup. If the user accidentally
initiated the program or wanted to quit they just lick "No" on the prompt.
#ce ----------------------------------------------------------------------------
Func InitiationPrompt()
   Local $iAnswer = MsgBox(BitOR($MB_YESNO, $MB_SYSTEMMODAL), "AutoIt Virtual Tour Script", "You have initiated the Virtual Tour Script. Continue?")    ; Prompt the user to run the script ­ use a Yes/No prompt with the flag parameter set at 4
   If $iAnswer = 7 Then ; Check the user's answer to the prompt
      Exit ; If "No" was clicked (7) then exit the script
   EndIf
   MsgBox($MB_SYSTEMMODAL, "Instructions", "Please allow 30 seconds to complete startup."  & @CRLF & @CRLF & "Press " & '"' & "Q" & '"' & @CRLF & "to terminate the program.") ;Notify user of how to escape
EndFunc

#cs ----------------------------------------------------------------------------
Change Mouse
This function opens the Run window to access the mouse properties and changes
the cursor to a single pixel cursor to make it "invisible"
#ce ----------------------------------------------------------------------------
Func ChangeMouse()
   Send("#r") ; Simulate the key combination Win + R to open the Run dialogue window.
   WinWait("Run", "", 10) ; Wait 10 seconds for the Run dialogue window to appear.
   Sleep(1000)
   Send("main.cpl{Enter}") ; Simulate entering main.cpl and pressing the 'ENTER' key.
   Global $mouse = WinWait("Mouse Properties", "", 10) ; Wait 10 seconds for the Notepad window to appear.
   Sleep(1000)
   Send("{TAB 5}") ;Navigate the window
   Sleep(1000)
   Send("{RIGHT}") ;Navigate the window
   Sleep(1000)
   Send("{TAB 5}") ;Navigate the window
   Sleep(1000)
   Send("{ENTER}") ;Navigate the window
   Sleep(1000)
   Send("+{TAB 2}") ;Navigate the window
   Sleep(1000)
   Send("{ENTER}") ;Navigate the window
   Sleep(1000)
   Send("dot.cur{ENTER}") ;Select the file
   Sleep(1000)
   Send("{TAB 4}{ENTER}") ;Navigate the window
   Sleep(1000)
EndFunc

#cs ----------------------------------------------------------------------------
Open PointerFocus
This function executes the PointerFocus mouse tracking program to use as a
spotlight
#ce ----------------------------------------------------------------------------
Func OpenPointerFocus()
   Send("#r") ; Simulate the key combination Win + R to open the Run dialogue window.
   WinWait("Run", "", 10) ; Wait 10 seconds for the Run dialogue window to appear.
   Sleep(100)
   Send("C:\Program Files\PointerFocus\PointerFocus.exe{Enter}") ; Simulate entering PointerFocus.exe and pressing the 'ENTER' key.
   Global $progPF = WinWait("PointerFocus", "", 10) ; Wait 10 seconds for the Notepad window to appear.
   Sleep(100)
   ;Send("{F10}") ;Send string to activate Mouse Spotlight
   ;Sleep(100)
   WinSetState($progPF, "", @SW_HIDE) ; Set the state of the Notepad window to "hide".
   Sleep(100)
EndFunc

#cs ----------------------------------------------------------------------------
White Screen Buttons
Creates an entirely white screen made of white buttons that play a defined audio
file when clicked on.
#ce ----------------------------------------------------------------------------
Func WhiteScreenButtons()
    ; Create a GUI with various controls.
    Local $hGUI = GUICreate("", 800, 1380)

    ; Create button controls.
	;Using $BS_BITMAP formats the button to appear as a defined Bitmap located on the following line
    Local $Top_Left = GUICtrlCreateButton("", 0, 0, 400, 320,$BS_BITMAP)
    GUICtrlSetImage(-1, "C:\Users\ECEN461\Desktop\ECEN461\Blank Button.bmp", 22)
    Local $Top_Right = GUICtrlCreateButton("", 400, 0, 400, 320,$BS_BITMAP)
    GUICtrlSetImage(-1, "C:\Users\ECEN461\Desktop\ECEN461\Blank Button.bmp", 22)
    Local $Up_1 = GUICtrlCreateButton("", 0, 320, 250, 320,$BS_BITMAP)
    GUICtrlSetImage(-1, "C:\Users\ECEN461\Desktop\ECEN461\Blank Button.bmp", 22)
	Local $Up_2 = GUICtrlCreateButton("",250 , 320, 110, 320,$BS_BITMAP)
    GUICtrlSetImage(-1, "C:\Users\ECEN461\Desktop\ECEN461\Blank Button.bmp", 22)
    Local $Up_3 = GUICtrlCreateButton("", 360, 320, 120, 320,$BS_BITMAP)
    GUICtrlSetImage(-1, "C:\Users\ECEN461\Desktop\ECEN461\Blank Button.bmp", 22)
    Local $Up_4 = GUICtrlCreateButton("",480, 320, 120, 320,$BS_BITMAP)
    GUICtrlSetImage(-1, "C:\Users\ECEN461\Desktop\ECEN461\Blank Button.bmp", 22)
	Local $Up_5 = GUICtrlCreateButton("", 600, 320, 200, 320,$BS_BITMAP)
    GUICtrlSetImage(-1, "C:\Users\ECEN461\Desktop\ECEN461\Blank Button.bmp", 22)
    Local $Mid_Left = GUICtrlCreateButton("", 0, 640, 300, 320,$BS_BITMAP)
    GUICtrlSetImage(-1, "C:\Users\ECEN461\Desktop\ECEN461\Blank Button.bmp", 22)
    Local $Mid_Right = GUICtrlCreateButton("", 300, 640, 500, 320,$BS_BITMAP)
    GUICtrlSetImage(-1, "C:\Users\ECEN461\Desktop\ECEN461\Blank Button.bmp", 22)
    Local $Bottom_Left = GUICtrlCreateButton("", 0, 960, 300, 320,$BS_BITMAP)
    GUICtrlSetImage(-1, "C:\Users\ECEN461\Desktop\ECEN461\Blank Button.bmp", 22)
    Local $Bottom_Right = GUICtrlCreateButton("", 300, 960, 600, 320,$BS_BITMAP)
    GUICtrlSetImage(-1, "C:\Users\ECEN461\Desktop\ECEN461\Blank Button.bmp", 22)
    ; Display the GUI.
    GUISetState(@SW_SHOW, $hGUI)

    Local $iPID = 0

    ; Loop until the user exits.
    Local $hDLL = DllOpen("user32.dll")
    While 1
      If _IsPressed("51", $hDLL) Then ; Else if a right-click
         Cleanup()
         ExitLoop ; Allow program to terminate
	  EndIf

	  ;In each of these cases:
	  ; The first "SoundPlay" is to end any previous SoundPlays that are already active
	  ; The second plays a short sound to audibly indicate the user that they have clicked on something
	  ; The third is the actual recorded description
	  ;Note: these filepaths are relative to the directory of this script file
	  Switch GUIGetMsg()
        Case $Top_Left
             $iPID = SoundPlay("")
			 Sleep(200)
			 SoundPlay ( "Recordings\Speech On.wav")
			 Sleep(500)
             SoundPlay ( "Recordings\MOPPY.mp3")
         Case $Top_Right
             $iPID = SoundPlay("")
			 Sleep(200)
			 SoundPlay ( "Recordings\Speech On.wav")
			 Sleep(500)
             SoundPlay ( "Recordings\NEWTECH.mp3")
         Case $Up_1
             $iPID = SoundPlay("")
			 Sleep(200)
			 SoundPlay ( "Recordings\Speech On.wav")
			 Sleep(500)
             SoundPlay ( "Recordings\620LX.mp3")
		 Case $Up_2
             $iPID = SoundPlay("")
			 Sleep(200)
			 SoundPlay ( "Recordings\Speech On.wav")
			 Sleep(500)
             SoundPlay ( "Recordings\PSION.mp3")
		 Case $Up_3
             $iPID = SoundPlay("")
			 Sleep(200)
			 SoundPlay ( "Recordings\Speech On.wav")
			 Sleep(500)
             SoundPlay ( "Recordings\PILOT.mp3")
         Case $Up_4
             $iPID = SoundPlay("")
			 Sleep(200)
			 SoundPlay ( "Recordings\Speech On.wav")
			 Sleep(500)
             SoundPlay ( "Recordings\POCKET.mp3")
         Case $Up_5
             $iPID = SoundPlay("")
			 Sleep(200)
			 SoundPlay ( "Recordings\Speech On.wav")
			 Sleep(500)
             SoundPlay ( "Recordings\NEWTON.mp3")
         Case $Mid_Left
             $iPID = SoundPlay("")
			 Sleep(200)
			 SoundPlay ( "Recordings\Speech On.wav")
			 Sleep(500)
             SoundPlay ( "Recordings\TSR-80.mp3")
         Case $Mid_Right
             $iPID = SoundPlay("")
			 Sleep(200)
			 SoundPlay ( "Recordings\Speech On.wav")
			 Sleep(500)
             SoundPlay ( "Recordings\TUBES.mp3")
         Case $Bottom_Left
             $iPID = SoundPlay("")
			 Sleep(200)
			 SoundPlay ( "Recordings\Speech On.wav")
			 Sleep(500)
             SoundPlay ( "Recordings\TESLA.mp3")
         Case $Bottom_Right
             $iPID = SoundPlay("")
			 Sleep(200)
			 SoundPlay ( "Recordings\Speech On.wav")
			 Sleep(500)
             SoundPlay ( "Recordings\BOX.mp3")
        EndSwitch
    WEnd

    ; Delete the previous GUI and all controls.
    GUIDelete($hGUI)

    ; Close the Notepad process using the PID returned by Run.
    If $iPID Then ProcessClose($iPID)
    EndFunc   ;==>End WhiteScreenButton

#cs ----------------------------------------------------------------------------
Cleanup
Restores the system to it original state:
-Changes the mouse back
-Closes PointerFocus
#ce ----------------------------------------------------------------------------
Func CleanUp()
   Send("#r") ; Simulate the key combination Win + R to open the Run dialogue window.
   Sleep(1000)
   WinWait("Run", "", 10) ; Wait 10 seconds for the Run dialogue window to appear.
   Send("main.cpl{Enter}") ; Simulate entering main.cpl and pressing the 'ENTER' key.
   Sleep(1000)
   WinWait("Mouse Properties", "", 10) ; Wait 10 seconds for the Notepad window to appear.
   Send("{TAB 5}")
   Sleep(100)
   Send("{RIGHT}")
   Sleep(100)
   Send("{TAB 5}")
   Sleep(100)
   Send("{ENTER}")
   Sleep(100)
   Send("{TAB 3}")
   Sleep(100)
   Send("{ENTER}") ;Change Tabs and Open Browse
   Sleep(100)
   WinSetState($progPF, "", @SW_SHOW) ; Set the state of the Notepad window to "hide".
   Sleep(1000)
   ;Send("{F10}") ;Send string to deactivate Mouse Spotlight
   ;Sleep(1000)
   WinClose("PointerFocus") ;$progPF is a GLOBAL variable in OpenPointerFocus
   Sleep(1000)
EndFunc
