Class extends _Dialog

Class constructor($params : Object)
	
	Super:C1705()
	
	This:C1470.顧客:={col: $params.selection; item: Null:C1517; sel: Null:C1517; pos: Null:C1517}
	This:C1470.検索窓:=""
	This:C1470.血液型:={A: True:C214; B: True:C214; AB: True:C214; O: True:C214}
	This:C1470.性別:={男: False:C215; 女: False:C215; どちらも: True:C214}
	This:C1470.検索条件:={検索窓: ""; 血液型: []; 性別: Null:C1517}
	
Function onLoad() : cs:C1710._Dialog顧客リスト
	
	Super:C1706.onLoad()
	
	This:C1470.顧客.headerNames:=This:C1470.getListboxHeaderNames("顧客")
	
	This:C1470.updateGender().updateBloodType().updateSearchString().updateControls()
	
	return This:C1470
	
Function onUnload() : cs:C1710._Dialog顧客リスト
	
	Super:C1706.onUnload()
	
	return This:C1470
	
Function query() : cs:C1710._Dialog顧客リスト
	
	var $顧客 : cs:C1710.顧客Selection
	var $search : Collection
	$search:=[]
	
	If (This:C1470.検索条件.血液型.length<4)
		$search.push("(血液型 in :1)")
	End if 
	
	If (This:C1470.検索条件.性別#Null:C1517)
		$search.push("(性別 == :2)")
	End if 
	
	$i:=3
	$params:=[This:C1470.検索条件.血液型; This:C1470.検索条件.性別]
	
	For each ($word; This:C1470.検索条件.検索窓)
		$search.push(["(名前 == :"; $i; " or 名前フリガナ == :"; $i; " or 住所 == :"; $i; " or 住所フリガナ == :"; $i; ")"].join(""))
		$params.push("@"+$word+"@")
		$i+=1
	End for each 
	
	If ($search.length=0)
		This:C1470.顧客.col:=ds:C1482.顧客.all()
	Else 
		$params.unshift($search.join(" and "))
		This:C1470.顧客.col:=ds:C1482.顧客.query.apply(ds:C1482.顧客; $params)
	End if 
	
	For each ($headerName; This:C1470.顧客.headerNames)
		OBJECT SET VALUE:C1742($headerName; 0)
	End for each 
	
	return This:C1470
	
Function updateGender() : cs:C1710._Dialog顧客リスト
	
	Case of 
		: (This:C1470.性別.男)
			This:C1470.検索条件.性別:="男"
		: (This:C1470.性別.女)
			This:C1470.検索条件.性別:="女"
		Else 
			This:C1470.検索条件.性別:=Null:C1517
	End case 
	
	return This:C1470
	
Function updateBloodType() : cs:C1710._Dialog顧客リスト
	
	This:C1470.検索条件.血液型.clear()
	
	If (This:C1470.血液型.A)
		This:C1470.検索条件.血液型.push("A")
	End if 
	
	If (This:C1470.血液型.B)
		This:C1470.検索条件.血液型.push("B")
	End if 
	
	If (This:C1470.血液型.AB)
		This:C1470.検索条件.血液型.push("AB")
	End if 
	
	If (This:C1470.血液型.O)
		This:C1470.検索条件.血液型.push("O")
	End if 
	
	return This:C1470
	
Function updateSearchString() : cs:C1710._Dialog顧客リスト
	
	If (OBJECT Get name:C1087(Object with focus:K67:3)="検索窓")
		$検索窓:=Get edited text:C655
	Else 
		$検索窓:=Form:C1466.検索窓
	End if 
	
	$全角空白:=Char:C90(0x3000)
	$検索窓:=Replace string:C233($検索窓; $全角空白; " "; *)
	This:C1470.検索条件.検索窓:=Split string:C1554($検索窓; " "; sk trim spaces:K86:2 | sk ignore empty strings:K86:1)
	
	return This:C1470
	
Function updateControls() : cs:C1710._Dialog顧客リスト
	
	OBJECT SET ENABLED:C1123(*; "削除"; (This:C1470.顧客.sel#Null:C1517) && (This:C1470.顧客.sel.length#0))
	
	return This:C1470
	
Function drop() : Object
	
	var $status : Object
	$status:={success: False:C215}
	
	CONFIRM:C162([This:C1470.顧客.sel.length; "件のレコードを削除しますか？"].join(""))
	
	If (OK=1)
		$status.success:=(This:C1470.顧客.sel.drop().length=0)
		This:C1470.query()
	End if 
	
	return $status
	