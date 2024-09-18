Class extends DataClass

Function searchPeople($search : Text) : cs:C1710.顧客Selection
	
	return This:C1470.query("名前 == :1 or 名前フリガナ == :1 or 住所 == :1 or 住所フリガナ == :1"; "@"+$search+"@")