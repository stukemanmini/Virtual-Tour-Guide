#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.12.0
 Author:         Shawn Sandberg & Justin Stucki

 Script Function:
	Used to create and visually see the defined button locations and alter accordingly
#ce ----------------------------------------------------------------------------
#include <GUIConstantsEx.au3>
#include <GUIButton.au3>
#include <ButtonConstants.au3>
#include <Misc.au3>
#include <Constants.au3>
#include <MsgBoxConstants.au3>

Func WhiteScreenButtons()
    ; Create a GUI with various controls.
    Local $hGUI = GUICreate("", 800, 1380)

    ; Create a button control.
    Local $Top_Left = GUICtrlCreateButton("", 0, 0, 400, 320,$BS_BITMAP)
    GUICtrlSetImage(-1, "C:\Users\ECEN461\Desktop\ECEN461\Blank Button1.bmp", 22)
    ;Local $Top_Mid = GUICtrlCreateButton("", 266, 0, 266, 320,$BS_BITMAP)
    ;GUICtrlSetImage(-1, "C:\Users\ECEN461\Desktop\ECEN461\Blank Button.bmp", 22)
    Local $Top_Right = GUICtrlCreateButton("", 400, 0, 400, 320,$BS_BITMAP)
    GUICtrlSetImage(-1, "C:\Users\ECEN461\Desktop\ECEN461\Blank Button.bmp", 22)
    Local $Up_1 = GUICtrlCreateButton("", 0, 320, 250, 320,$BS_BITMAP)
    GUICtrlSetImage(-1, "C:\Users\ECEN461\Desktop\ECEN461\Blank Button1.bmp", 22)
	Local $Up_2 = GUICtrlCreateButton("",250 , 320, 110, 320,$BS_BITMAP)
    GUICtrlSetImage(-1, "C:\Users\ECEN461\Desktop\ECEN461\Blank Button2.bmp", 22)
    Local $Up_3 = GUICtrlCreateButton("", 360, 320, 120, 320,$BS_BITMAP)
    GUICtrlSetImage(-1, "C:\Users\ECEN461\Desktop\ECEN461\Blank Button.bmp", 22)
    Local $Up_4 = GUICtrlCreateButton("",480, 320, 120, 320,$BS_BITMAP)
    GUICtrlSetImage(-1, "C:\Users\ECEN461\Desktop\ECEN461\Blank Button1.bmp", 22)
	Local $Up_5 = GUICtrlCreateButton("", 600, 320, 200, 320,$BS_BITMAP)
    GUICtrlSetImage(-1, "C:\Users\ECEN461\Desktop\ECEN461\Blank Button.bmp", 22)
    Local $Mid_Left = GUICtrlCreateButton("", 0, 640, 300, 320,$BS_BITMAP)
    GUICtrlSetImage(-1, "C:\Users\ECEN461\Desktop\ECEN461\Blank Button2.bmp", 22)
    ;Local $Mid_Mid = GUICtrlCreateButton("", 400, 640, 266, 320,$BS_BITMAP)
    ;GUICtrlSetImage(-1, "C:\Users\ECEN461\Desktop\ECEN461\Blank Button.bmp", 22)
    Local $Mid_Right = GUICtrlCreateButton("", 300, 640, 500, 320,$BS_BITMAP)
    GUICtrlSetImage(-1, "C:\Users\ECEN461\Desktop\ECEN461\Blank Button.bmp", 22)
    Local $Bottom_Left = GUICtrlCreateButton("", 0, 960, 300, 320,$BS_BITMAP)
    GUICtrlSetImage(-1, "C:\Users\ECEN461\Desktop\ECEN461\Blank Button.bmp", 22)
   ;Local $Bottom_Mid = GUICtrlCreateButton("", 266, 960, 266, 320,$BS_BITMAP)
    ;GUICtrlSetImage(-1, "C:\Users\ECEN461\Desktop\ECEN461\Blank Button.bmp", 22)
    Local $Bottom_Right = GUICtrlCreateButton("", 300, 960, 600, 320,$BS_BITMAP)
    GUICtrlSetImage(-1, "C:\Users\ECEN461\Desktop\ECEN461\Blank Button1.bmp", 22)
    ; Display the GUI.
    GUISetState(@SW_SHOW, $hGUI)

    Local $iPID = 0

    ; Loop until the user exits.
    Local $hDLL = DllOpen("user32.dll")
    While 1
      If _IsPressed("51", $hDLL) Then ; Else if a right-click
        ; Cleanup()
         ExitLoop ; Allow program to terminate
	  EndIf
	  Switch GUIGetMsg()
        Case $Top_Left
             $iPID = SoundPlay("")
             SoundPlay ( "Recordings/STE-000.mp3")
         ;Case $Top_Mid
             $iPID = SoundPlay("")
             SoundPlay ( "Kongos - Come with Me Now.mp3")
         Case $Top_Right
             $iPID = SoundPlay("")
             SoundPlay ( "Radical Face - Welcome home.mp3")
         Case $Up_1
             $iPID = SoundPlay("")
             SoundPlay ( "Bastille - Daniel in the Den.mp3")
		 Case $Up_2
             $iPID = SoundPlay("")
             SoundPlay ( "Bastille - Daniel in the Den.mp3")
		 Case $Up_3
             $iPID = SoundPlay("")
             SoundPlay ( "Bastille - Daniel in the Den.mp3")
         Case $Up_4
             $iPID = SoundPlay("")
             SoundPlay ( "Bastille - Get Home.mp3")
         Case $Up_5
             $iPID = SoundPlay("")
             SoundPlay ( "Kongos - Come with Me Now.mp3")
         Case $Mid_Left
             $iPID = SoundPlay("")
             SoundPlay ( "Radical Face - Welcome home.mp3")
         ;Case $Mid_Mid
             $iPID = SoundPlay("")
             SoundPlay ( "Bastille - Daniel in the Den.mp3")
         Case $Mid_Right
             $iPID = SoundPlay("")
             SoundPlay ( "Bastille - Get Home.mp3")
         Case $Bottom_Left
             $iPID = SoundPlay("")
             SoundPlay ( "Radical Face - Welcome home.mp3")
         ;Case $Bottom_Mid
             $iPID = SoundPlay("")
             SoundPlay ( "Bastille - Daniel in the Den.mp3")
         Case $Bottom_Right
             $iPID = SoundPlay("")
             SoundPlay ( "Bastille - Get Home.mp3")
        EndSwitch
    WEnd

    ; Delete the previous GUI and all controls.
    GUIDelete($hGUI)

    ; Close the Notepad process using the PID returned by Run.
    If $iPID Then ProcessClose($iPID)
    EndFunc   ;==>End WhiteScreenButton

;InitiationPrompt()
;BlockInput(1) ;Blocks the users input
;ChangeMouse()
;OpenPointerFocus()
;BlockInput(0) ; Unblocks the users Input
WhiteScreenButtons()
