C_TEXT:C284($1; $2; $3; $4; $5; $6)

$URL:=$1

Case of 
	: ($URL="/findPeople@")
		
		ARRAY TEXT:C222($names; 0)
		ARRAY TEXT:C222($values; 0)
		WEB GET VARIABLES:C683($names; $values)
		
		$idx:=Find in array:C230($names; "name")
		If ($idx#-1)
			$name:=$values{$idx}
			$顧客:=ds:C1482.顧客.query("名前 == :1 or 名前フリガナ == :1"; $name)
		Else 
			$顧客:=ds:C1482.顧客.newSelection()
		End if 
		
		$response:={}
		$response.顧客:=$顧客.toCollection("表示名,年齢,住所")
		
		$json:=JSON Stringify:C1217($response)
		
		WEB SEND TEXT:C677($json; "application/json")
		
End case 