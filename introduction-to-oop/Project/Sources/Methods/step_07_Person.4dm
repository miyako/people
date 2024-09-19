//%attributes = {}
#DECLARE($params : Object)

If (Count parameters:C259=0)
	
	CALL WORKER:C1389(1; Current method name:C684; New object:C1471)
	
Else 
	
	var $person : cs:C1710.Person
	
	$person:=cs:C1710.Person.new()
	
	$person.firstName:="Keisuke"
	$person.lastName:="Miyako"
	$person.birthday:=!1974-09-22!
	
	$form:=cs:C1710.PersonForm.new($person)
	
End if 