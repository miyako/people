//%attributes = {}
#DECLARE($params : Object)

If (Count parameters:C259=0)
	
	CALL WORKER:C1389("顧客"; Current method name:C684; {})
	
Else 
	
	$form:={}
	$form.顧客:={col: ds:C1482.顧客.all(); item: Null:C1517; sel: Null:C1517; pos: Null:C1517}
	
	$window:=Open form window:C675("入力"; *)
	DIALOG:C40("入力"; $form; *)
	
End if 