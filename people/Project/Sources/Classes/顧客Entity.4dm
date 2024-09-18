Class extends Entity

Function 商品別販売実績($商品名 : Text) : Collection
	
	$stats:=[]
	
	$販売:=This:C1470.販売.query("商品.商品名 == :1"; $商品名)
	
	For each ($販売月; $販売.販売月)
		$月別販売実績:=$販売.query("販売月 == :1"; $販売月)
		$stats.push({販売月: $販売月; count: $月別販売実績.sum("数"); dates: $月別販売実績.toCollection("日付,数")})
	End for each 
	
	return $stats
	
Function 月別販売実績($販売月 : Integer) : Collection
	
	$stats:=[]
	
	$販売:=This:C1470.販売.query("販売月 == :1"; $販売月)
	
	For each ($商品; $販売.商品)
		$商品別販売実績:=$販売.query("商品Id == :1 order by 日付 asc"; $商品.Id)
		$stats.push({商品名: $商品.商品名; count: $商品別販売実績.sum("数"); dates: $商品別販売実績.toCollection("日付,数")})
	End for each 
	
	return $stats
	
local Function get 表示名() : Text
	
	return This:C1470.名前+"（"+This:C1470.名前フリガナ+"）"
	
local Function get 年齢() : Integer
	
	return ds:C1482.年齢(Current date:C33; This:C1470.生年月日)
	
local Function get タイトル() : Text
	
	If (This:C1470.isNew())
		return ["顧客 ("; "新規"; ")"].join("")
	Else 
		return ["顧客 ("; This:C1470.getKey(dk key as string:K85:16); ")"].join("")
	End if 
	
local Function displayDetail()
	
	$processName:="顧客"
	$formName:="詳細"
	$windowTitle:=This:C1470.タイトル
	
	var $selection : 4D:C1709.EntitySelection
	$selection:=This:C1470.getSelection()
	CALL WORKER:C1389($processName; ds:C1482.dialog; {\
		formName: $formName; \
		tableNumber: This:C1470.getDataClass().getInfo().tableNumber; \
		windowTitle: $windowTitle; \
		controllerClass: cs:C1710._Dialog顧客詳細; \
		key: (This:C1470.isNew() ? Null:C1517 : This:C1470.getKey()); \
		selection: ($selection#Null:C1517 ? $selection : Null:C1517); \
		idx: ($selection#Null:C1517 ? This:C1470.indexOf() : Null:C1517)})