$event:=FORM Event:C1606

If (OB Instance of:C1731(Form:C1466; cs:C1710.PersonForm))
	
	Case of 
		: ($event.code=On Load:K2:1)
			
			Form:C1466.onLoad()
			
		: ($event.code=On Data Change:K2:15)
			
			Form:C1466.onDataChange()
			
		: ($event.code=On Clicked:K2:4)
			
			Form:C1466.onClicked()
			
		: ($event.code=On Unload:K2:2)
			
			Form:C1466.onUnload()
			
	End case 
	
End if 