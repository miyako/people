//%attributes = {}
ds:C1482.startRequestLog(1000)

$顧客:=ds:C1482.顧客.query("名前フリガナ == :1"; "@い")
$商品:=$顧客.販売.商品

$RL:=ds:C1482.getRequestLog()

ds:C1482.stopRequestLog()