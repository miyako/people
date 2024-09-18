Class constructor
	
Function onLoad() : cs:C1710._Dialog
	
	SET MENU BAR:C67(1)
	
	If (This:C1470.isSDI())
		HIDE MENU BAR:C432
	End if 
	
	return This:C1470
	
Function isSDI() : Boolean
	
	If (Is Windows:C1573)
		var $x; $y; $right; $bottom : Integer
		GET WINDOW RECT:C443($x; $y; $right; $bottom; -1)
		If ($x=0) && ($y=0) && ($right=0) && ($bottom=0)
			return True:C214
		End if 
	End if 
	
	return False:C215
	
Function isLastWindow() : Boolean
	
	ARRAY LONGINT:C221($windows; 0)
	WINDOW LIST:C442($windows)
	If (Size of array:C274($windows)=1)
		return True:C214
	End if 
	
	return False:C215
	
Function onUnload() : cs:C1710._Dialog
	
	KILL WORKER:C1390
	
	If (This:C1470.isSDI())
		SHOW MENU BAR:C431
	End if 
	
	If (This:C1470.isSDI()) && (This:C1470.isLastWindow())
		QUIT 4D:C291
	End if 
	
	return This:C1470
	
Function activate()
	
	var $currentFormWindow : Integer
	$currentFormWindow:=Current form window:C827
	
	var $x; $y; $right; $bottom : Integer
	GET WINDOW RECT:C443($x; $y; $right; $bottom; $currentFormWindow)
	SET WINDOW RECT:C444($x; $y; $right; $bottom; $currentFormWindow)
	
Function getListboxHeaderNames($objectName : Text) : Collection
	
	$headerNames:=[]
	
	If (OBJECT Get type:C1300(*; $objectName)=Object type listbox:K79:8)
		ARRAY TEXT:C222($objects; 0)
		LISTBOX GET OBJECTS:C1302(*; $objectName; $objects)
		For ($i; 1; Size of array:C274($objects))
			$object:=$objects{$i}
			If (OBJECT Get type:C1300(*; $object)=Object type listbox header:K79:9)
				$headerNames.push($object)
			End if 
		End for 
	End if 
	
	return $headerNames