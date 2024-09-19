Class extends Person

Class constructor
	
	//MARK: スーパークラスの初期化
	
	Super:C1705()
	
Function yearLevel($currentDate : Date)
	
	Case of 
		: (This:C1470.birthday=Null:C1517)
			return Null:C1517
			
		: (This:C1470.birthday=!00-00-00!)
			return Null:C1517
			
		Else 
			
			return This:C1470._学年($currentDate; This:C1470.birthday)
			
	End case 
	
Function get currentYearLevel() : Text
	
	var $currentYearLevel : cs:C1710.YearLevel
	
	$currentYearLevel:=This:C1470.yearLevel(Current date:C33; This:C1470.birthday)
	
	Case of 
		: ($currentYearLevel=Null:C1517)
			return ""
		Else 
			return $currentYearLevel.school+$currentYearLevel.grade
	End case 
	
	//MARK: プライベートメンバー関数
	
Function _学年($currentDate : Date; $birthDate : Date) : cs:C1710.YearLevel
	
	$startOfSchoolYear:=Add to date:C393(!00-00-00!; Year of:C25($currentDate); 4; 1)
	
	$age:=This:C1470._年齢($startOfSchoolYear; $birthDate).years
	
	Case of 
		: ($age=6)
			return cs:C1710.YearLevel.new("小学校"; "一年生")
		: ($age=7)
			return cs:C1710.YearLevel.new("小学校"; "二年生")
		: ($age=8)
			return cs:C1710.YearLevel.new("小学校"; "三年生")
		: ($age=9)
			return cs:C1710.YearLevel.new("小学校"; "四年生")
		: ($age=10)
			return cs:C1710.YearLevel.new("小学校"; "五年生")
		: ($age=11)
			return cs:C1710.YearLevel.new("小学校"; "六年生")
		: ($age=12)
			return cs:C1710.YearLevel.new("中学校"; "一年生")
		: ($age=13)
			return cs:C1710.YearLevel.new("中学校"; "二年生")
		: ($age=14)
			return cs:C1710.YearLevel.new("中学校"; "三年生")
		: ($age=15)
			return cs:C1710.YearLevel.new("高等学校"; "一年生")
		: ($age=16)
			return cs:C1710.YearLevel.new("高等学校"; "二年生")
		: ($age=17)
			return cs:C1710.YearLevel.new("高等学校"; "三年生")
		Else 
			return Null:C1517
	End case 