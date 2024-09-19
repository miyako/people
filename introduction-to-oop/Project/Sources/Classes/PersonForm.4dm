Class constructor($person : cs:C1710.Person)
	
	This:C1470._class:=OB Class:C1730($person)
	This:C1470._instance:=$person
	
	This:C1470[Lowercase:C14(This:C1470._class.name; *)]:=This:C1470._instance
	
	var $className : Text
	
	$className:=OB Class:C1730($person).name
	
	$window:=Open form window:C675($className)
	DIALOG:C40($className; This:C1470; *)
	
Function onLoad()
	
	This:C1470.onDataChange()
	
Function onDataChange()
	
	SET WINDOW TITLE:C213(This:C1470._instance.fullName; Current form window:C827)
	
	return Form:C1466
	
Function onUnload()