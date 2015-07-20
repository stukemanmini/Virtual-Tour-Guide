#include <GUIConstantsEx.au3>
#include <SendMessage.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>
#AutoIt3Wrapper_Au3Check_Parameters=-q -d -w 1 -w 2 -w 3 -w- 4 -w 5 -w 6 -w- 7

Example() ; Idea by prizm1

Func Example()
    Local $hGUI = GUICreate("Sensor Reading")
    Local $idOK = GUICtrlCreateButton("Close", 310, 370, 85, 25)

    Local $reading = WinGetText("COM")
	;Local $reading = "5"

    GUICtrlCreateLabel($reading, 10, 30, 70)
    MsgBox(1, "Sensor Reading", "Reading: " & $reading, 0)

   ;Display the GUI.
	GUISetState(@SW_SHOW, $hGUI)
    GUIDelete($hGUI)

 EndFunc   ;==>Example
