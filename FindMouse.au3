#cs ----------------------------------------------------------------------------
A simple AutoIt script that locates the mouse and display the coordinates in a 
dialog box. Useful for defining the button dimensions in the Virtual Tour Guide code.
#ce ----------------------------------------------------------------------------
#include <MsgBoxConstants.au3>

Local $aPos = MouseGetPos()
MsgBox($MB_SYSTEMMODAL, "Mouse x, y:", $aPos[0] & ", " & $aPos[1])
