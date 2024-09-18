Class extends DataStoreImplementation

local Function findWindowByTitle($windowTitle : Text) : Integer
	
	ARRAY LONGINT:C221($windows; 0)
	WINDOW LIST:C442($windows)
	
	For ($i; 1; Size of array:C274($windows))
		If (Get window title:C450($windows{$i})=$windowTitle)
			return $windows{$i}
			break
		End if 
	End for 
	
	return 0
	
local Function 年齢($currentDate : Date; $birthDate : Date) : Integer
	
	C_LONGINT:C283($years; $months; $days)
	
	$birthYear:=Year of:C25($birthDate)
	$birthMonth:=Month of:C24($birthDate)
	$birthDay:=Day of:C23($birthDate)
	
	$currentYear:=Year of:C25($currentDate)
	$currentMonth:=Month of:C24($currentDate)
	$currentDay:=Day of:C23($currentDate)
	
	$thisBirthDay:=Add to date:C393(!00-00-00!; $currentYear; $birthMonth; $birthDay)
	
	//get years and months
	$years:=$currentYear-$birthYear
	$months:=$currentMonth-$birthMonth
	
	Case of 
		: (Month of:C24($birthDate)=2) & (Month of:C24($thisBirthDay)=3) & ($currentDate=$thisBirthDay)
			//today=birthday this year=mar 1, birthday is feb 29
			$months:=0
			$days:=0
		: (Month of:C24($birthDate)=2) & (Month of:C24($thisBirthDay)=3) & ($currentDate>$thisBirthDay) & ($currentMonth=3)
			//birthday this year is in the past, birthday is feb 29, current year is not leap
			$months:=0
			$days:=$currentDay-1
		: (Month of:C24($birthDate)=2) & (Month of:C24($thisBirthDay)=3) & ($currentMonth=1)
			//birthday this year is in the future, birthday is feb 29, current year is not leap, count days from previous month=dec
			$years:=$years-1
			$months:=$months+12
			$days:=$currentDate-Add to date:C393(!00-00-00!; $currentYear-1; 12; $birthDay)
		: (Month of:C24($birthDate)=2) & (Month of:C24($thisBirthDay)=3)
			//birthday this year is in the past, birthday is feb 29, current year is not leap, count days from previous month
			$days:=$currentDate-Add to date:C393(!00-00-00!; $currentYear; $currentMonth-1; $birthDay)
		: ($currentDate<$thisBirthDay) & ($birthDay>$currentDay) & ($currentMonth=1)
			//birthday this year is in the future, count days from previous month=dec
			$years:=$years-1
			$months:=$months+11
			$days:=$currentDate-Add to date:C393(!00-00-00!; $currentYear-1; 12; $birthDay)
		: ($currentDate<$thisBirthDay) & ($birthDay>$currentDay)
			//birthday this year is in the future, count days from previous month
			$years:=$years-1
			$months:=$months+11
			$days:=$currentDate-Add to date:C393(!00-00-00!; $currentYear; $currentMonth-1; $birthDay)
		: ($currentDate<$thisBirthDay)
			//birthday this year is in the future, count days from current month
			$years:=$years-1
			$months:=$months+12
			$days:=$currentDay-$birthDay
		: ($currentDate=$thisBirthDay)
			//today=birthday 
			$months:=0
			$days:=0
		: ($birthDay>$currentDay) & ($currentMonth=1)
			//birthday this year is in the past, count days from previous month=dec
			$months:=$months-1
			$days:=$currentDate-Add to date:C393(!00-00-00!; $currentYear; $currentMonth-1; $birthDay)
		: ($birthDay>$currentDay)
			//birthday this year is in the past, count days from previous month
			$months:=$months-1
			$lastDayOfPreviousMonth:=Day of:C23(Add to date:C393(!00-00-00!; $currentYear; $currentMonth; 1)-1)
			If ($lastDayOfPreviousMonth>$birthDay)
				$days:=$currentDate-Add to date:C393(!00-00-00!; $currentYear; $currentMonth-1; $birthDay)
			Else 
				$days:=$currentDate-Add to date:C393(!00-00-00!; $currentYear; $currentMonth-1; $lastDayOfPreviousMonth)
			End if 
		Else 
			//birthday this year is in the past, count days from current month
			$days:=$currentDay-$birthDay
	End case 
	
	return $years
	
local Function dialog($params : Object)
	
	var $window : Integer
	$window:=ds:C1482.findWindowByTitle($params.windowTitle)
	
	If ($window#0)
		CALL FORM:C1391($window; Formula:C1597(Form:C1466.activate()))
	Else 
		var $table : Pointer
		$table:=Table:C252($params.tableNumber)
		
		var $form : cs:C1710._Dialog
		$form:=$params.controllerClass.new($params)
		
		$window:=Open form window:C675($table->; $params.formName; *)
		SET WINDOW TITLE:C213($params.windowTitle; $window)
		DIALOG:C40($table->; $params.formName; $form; *)
		
	End if 