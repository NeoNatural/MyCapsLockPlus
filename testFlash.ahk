global flashWinID

;InitFlashingWinTrigger:
Gui +LastFound
hWnd := WinExist() , DllCall( "RegisterShellHookWindow", UInt,hWnd )
MsgNum := DllCall( "RegisterWindowMessage", Str,"SHELLHOOK" )
OnMessage( MsgNum, "ShellMessage" )

;Return 

ShellMessage( wParam,lParam ) {
  global flashWinID
  If ( wParam = 0x8006 ) ;  0x8006 is 32774 as shown in Spy!
    {
					
		flashWinID := lParam				      
    }
}
; right-alt + right-win - activate last flashing window
<!F4:: WinActivate, ahk_id %flashWinID%