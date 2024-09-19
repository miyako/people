Class extends PersonForm

Class constructor($contact : cs:C1710.Contact)
	
	Super:C1705($contact)
	
Function onLoad()
	
	Super:C1706.onLoad()
	
	OBJECT GET COORDINATES:C663(*; "Form.contact.lastName"; $left1; $top1; $right1; $bottom1)
	OBJECT GET COORDINATES:C663(*; "Form.contact.firstName"; $left2; $top2; $right2; $bottom2)
	
	Form:C1466._coord:={}
	Form:C1466._coord.field1:={x: $left1; y: $top1; width: $right1-$left1; height: $bottom1-$top1}
	Form:C1466._coord.field2:={x: $left2; y: $top2; width: $right2-$left2; height: $bottom2-$top2}
	
Function onClicked()
	
	$coord:=Form:C1466._coord
	
	If (This:C1470._instance.lastNameFirst)
		
		OBJECT SET COORDINATES:C1248(*; "Form.contact.lastName"; $coord.field1.x; $coord.field1.y)
		OBJECT SET COORDINATES:C1248(*; "Form.contact.firstName"; $coord.field2.x; $coord.field2.y)
		
	Else 
		
		OBJECT SET COORDINATES:C1248(*; "Form.contact.lastName"; $coord.field2.x; $coord.field2.y)
		OBJECT SET COORDINATES:C1248(*; "Form.contact.firstName"; $coord.field1.x; $coord.field1.y)
		
	End if 
	
	return Form:C1466.onDataChange()