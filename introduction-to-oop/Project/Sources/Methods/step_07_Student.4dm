//%attributes = {}
#DECLARE($params : Object)

If (Count parameters:C259=0)
	
	CALL WORKER:C1389(1; Current method name:C684; New object:C1471)
	
Else 
	
	var $student : cs:C1710.Student
	
	$student:=cs:C1710.Student.new()
	
	$student.firstName:="けいすけ"
	$student.lastName:="宮古"
	$student.birthday:=!2007-03-31!
	
	$form:=cs:C1710.StudentForm.new($student)
	
End if 