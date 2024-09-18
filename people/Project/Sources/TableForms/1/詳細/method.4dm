$event:=FORM Event:C1606

Case of 
	: ($event.code=On Load:K2:1)
		
		Form:C1466.onLoad()
		
	: ($event.code=On Unload:K2:2)
		
		Form:C1466.onUnload()
		
	: ($event.code=On Data Change:K2:15)
		
		Form:C1466.updateControls()
		
	: ($event.code=On Clicked:K2:4)
		
		Case of 
			: ($event.objectName="First")
				Form:C1466.first().updateControls().updateWindowTitle()
			: ($event.objectName="Previous")
				Form:C1466.previous().updateControls().updateWindowTitle()
			: ($event.objectName="Next")
				Form:C1466.next().updateControls().updateWindowTitle()
			: ($event.objectName="Last")
				Form:C1466.last().updateControls().updateWindowTitle()
			: ($event.objectName="Save")
				Form:C1466.save().updateControls()
		End case 
		
End case 