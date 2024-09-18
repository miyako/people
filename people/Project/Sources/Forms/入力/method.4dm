$event:=FORM Event:C1606

Case of 
	: ($event.code=On After Edit:K2:43)
		
		Case of 
			: ($event.objectName="検索窓")
				
				If (Get edited text:C655="")
					Form:C1466.顧客.col:=ds:C1482.顧客.all()
				End if 
				
		End case 
		
	: ($event.code=On Data Change:K2:15)
		
		Case of 
			: ($event.objectName="検索窓")
				
				Form:C1466.顧客.col:=ds:C1482.顧客.searchPeople(Form:C1466.search)
				
		End case 
		
End case 