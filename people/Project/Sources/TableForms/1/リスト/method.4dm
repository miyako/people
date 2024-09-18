$event:=FORM Event:C1606

Case of 
	: ($event.code=On Load:K2:1)
		
		Form:C1466.onLoad()
		
	: ($event.code=On Unload:K2:2)
		
		Form:C1466.onUnload()
		
	: ($event.code=On After Edit:K2:43)
		
		Case of 
			: ($event.objectName="検索窓")
				Form:C1466.updateSearchString().query()
		End case 
		
	: ($event.code=On Clicked:K2:4)
		
		Case of 
			: ($event.objectName="性別.@")
				Form:C1466.updateGender().query()
			: ($event.objectName="血液型.@")
				Form:C1466.updateBloodType().query()
			: ($event.objectName="追加")
				ds:C1482.顧客.new().displayDetail()
			: ($event.objectName="削除")
				$status:=Form:C1466.drop()
		End case 
		
	: ($event.code=On Double Clicked:K2:5)
		
		If ($event.objectName="顧客")
			If (Form:C1466.顧客.item#Null:C1517)
				Form:C1466.顧客.item.displayDetail()
			Else 
				ds:C1482.顧客.new().displayDetail()
			End if 
		End if 
		
	: ($event.code=On Data Change:K2:15)
		
		If ($event.objectName="検索窓")
			Form:C1466.query()
		End if 
		
	: ($event.code=On Selection Change:K2:29)
		
		Form:C1466.updateControls()
		
End case 