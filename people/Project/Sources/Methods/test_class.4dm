//%attributes = {}
//$status:=年齢(Current date; !1974-09-22!)

var $顧客 : cs:C1710.顧客Entity
$顧客:=ds:C1482.顧客.searchPeople("あ")
$myname:=ds:C1482.myname()