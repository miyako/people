//%attributes = {}
#DECLARE($params : Object)

If (Count parameters:C259=0)
	
	CALL WORKER:C1389(1; Current method name:C684; New object:C1471)
	
Else 
	
	var $contact : cs:C1710.Contact
	
	$contact:=cs:C1710.Contact.new()
	
	$contact.firstName:="ケイスケ"
	$contact.lastName:="宮古"
	$contact.birthday:=!1974-09-22!
	
	$form:=cs:C1710.ContactForm.new($contact)
	
End if 