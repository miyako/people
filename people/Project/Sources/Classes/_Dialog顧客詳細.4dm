Class extends _Dialog

Class constructor($params : Object)
	
	Super:C1705()
	
	If ($params.selection#Null:C1517)
		
		This:C1470.顧客:=$params.selection.at($params.idx)
		
	Else 
		
		var $顧客 : cs:C1710.顧客Entity
		$顧客:=ds:C1482.顧客.get($params.key)
		This:C1470.顧客:=$顧客#Null:C1517 ? $顧客 : ds:C1482.顧客.new()
		
	End if 
	
Function onLoad() : cs:C1710._Dialog顧客詳細
	
	Super:C1706.onLoad()
	
	This:C1470.updateControls().updateWindowTitle()
	
	return This:C1470
	
Function onUnload() : cs:C1710._Dialog顧客詳細
	
	return This:C1470
	
Function updateWindowTitle() : cs:C1710._Dialog顧客詳細
	
	SET WINDOW TITLE:C213(This:C1470.顧客.タイトル; Current form window:C827)
	
	return This:C1470
	
Function updateControls() : cs:C1710._Dialog顧客詳細
	
	$idx:=This:C1470.顧客#Null:C1517 ? This:C1470.顧客.indexOf() : -1
	
	var $selection : 4D:C1709.EntitySelection
	$selection:=This:C1470.顧客.getSelection()
	
	OBJECT SET ENABLED:C1123(*; "First"; 0<$idx)
	OBJECT SET ENABLED:C1123(*; "Previous"; 0<$idx)
	OBJECT SET ENABLED:C1123(*; "Last"; ($selection#Null:C1517) && ($selection.length>($idx+1)))
	OBJECT SET ENABLED:C1123(*; "Next"; ($selection#Null:C1517) && ($selection.length>($idx+1)))
	OBJECT SET ENABLED:C1123(*; "Save"; (This:C1470.顧客#Null:C1517) && This:C1470.顧客.touched())
	
	return This:C1470
	
Function updateList() : cs:C1710._Dialog顧客詳細
	
	return This:C1470
	
Function first() : cs:C1710._Dialog顧客詳細
	
	This:C1470.顧客:=This:C1470.顧客.first()
	
	return This:C1470
	
Function previous() : cs:C1710._Dialog顧客詳細
	
	This:C1470.顧客:=This:C1470.顧客.previous()
	
	return This:C1470
	
Function next() : cs:C1710._Dialog顧客詳細
	
	This:C1470.顧客:=This:C1470.顧客.next()
	
	return This:C1470
	
Function last() : cs:C1710._Dialog顧客詳細
	
	This:C1470.顧客:=This:C1470.顧客.last()
	
	return This:C1470
	
Function save() : Object
	
	var $status : Object
	$status:={success: False:C215}
	
	$status:=This:C1470.顧客.save(dk auto merge:K85:24)
	
	Case of 
		: ($status.success)
			
			$window:=ds:C1482.findWindowByTitle("顧客リスト")
			
			If ($window#0)
				CALL FORM:C1391($window; This:C1470.updateList)
			End if 
			
		: ($status.status=dk status automerge failed:K85:25)
			$status.errorMessage:="顧客を保存できませんでした。再試行してください。"
			var $touchedAttributes : Collection
			$touchedAttributes:=This:C1470.顧客.touchedAttributes()
			var $old : cs:C1710.顧客Entity
			$old:=This:C1470.顧客.clone()
			This:C1470.顧客.reload()
			For each ($touchedAttribute; $touchedAttributes)
				This:C1470.顧客[$touchedAttribute]:=$old[$touchedAttribute]
			End for each 
	End case 
	
	return This:C1470
	