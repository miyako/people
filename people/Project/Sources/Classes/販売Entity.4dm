Class extends Entity

Function get 販売月() : Integer
	
	return Month of:C24(This:C1470.日付)
	
Function query 販売月($event : Object) : Object
	
	$result:={}
	$result.query:=""
	$result.parameters:=[]
	
	$today:=Current date:C33
	$thisMonth:=Month of:C24($today)
	$month:=$event.value
	
	If ($month>$thisMonth)
		$year:=Year of:C25($today)-1
	Else 
		$year:=Year of:C25($today)
	End if 
	
	$start:=Add to date:C393(!00-00-00!; $year; $month; 1)
	$end:=Add to date:C393(!00-00-00!; $year; $month+1; 1)-1
	
	$result.query:="日付 >= :1 and 日付 <= :2"
	$result.parameters:=[$start; $end]
	