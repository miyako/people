property lastNameFirst : Boolean

Class extends Person

Class constructor
	
	//MARK: スーパークラスの初期化
	
	Super:C1705()
	
	This:C1470.lastNameFirst:=True:C214
	
Function get fullName : Text
	
	Case of 
		: (This:C1470.lastNameFirst)
			return New collection:C1472(This:C1470.lastName; This:C1470.firstName).join(" "; ck ignore null or empty:K85:5)
		Else 
			return Super:C1706["get fullName"]()
	End case 