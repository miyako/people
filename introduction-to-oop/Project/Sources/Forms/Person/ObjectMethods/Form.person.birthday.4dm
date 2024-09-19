If (OB Instance of:C1731(Form:C1466; cs:C1710.PersonForm))
	
	Case of 
		: (FORM Event:C1606.code=On Load:K2:1)
			
			OBJECT SET VALUE:C1742(OBJECT Get name:C1087; Form:C1466.person.birthday)
			
	End case 
	
End if 