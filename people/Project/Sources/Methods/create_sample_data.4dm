//%attributes = {"invisible":true}
$全顧客:=ds:C1482.顧客.all()
$顧客数:=ds:C1482.顧客.getCount()
$全商品:=ds:C1482.商品.all()
$商品数:=ds:C1482.商品.getCount()

For ($i; 1; 100000)
	
	$顧客:=$全顧客.at((Random:C100%$顧客数))
	
	$items:=(Random:C100%10)+1
	
	$商品Id:=[]
	For ($ii; 1; $items)
		$商品Id.push($全商品.at((Random:C100%$商品数)).getKey())
	End for 
	
	For each ($商品; ds:C1482.商品.query("Id in :1"; $商品Id.distinct()))
		
		$販売:=ds:C1482.販売.new()
		$販売.商品:=$商品
		$販売.顧客:=$顧客
		$販売.数:=(Random:C100%10)+1
		$販売.日付:=!2024-01-01!+(Random:C100%365)+1
		$販売.save()
		
	End for each 
	
End for 