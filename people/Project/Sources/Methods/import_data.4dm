//%attributes = {"invisible":true}
var $folder : 4D:C1709.Folder
var $file : 4D:C1709.File

$folder:=Folder:C1567(fk desktop folder:K87:19)
$file:=$folder.file("data.txt")

$text:=$file.getText("windows-31j"; Document with CR:K24:21)
var $values : Collection

For each ($line; Split string:C1554($text; "\r"; sk ignore empty strings:K86:1); 1)
	$values:=Split string:C1554($line; "\t")
	
	var $顧客 : cs:C1710.顧客Entity
	
	$顧客:=ds:C1482.顧客.new()
	
	$顧客.名前:=$values[0]
	$顧客.名前フリガナ:=$values[1]
	$顧客.性別:=$values[2]
	$顧客.血液型:=$values[3]
	$顧客.生年月日:=Date:C102($values[4])
	$顧客.電話番号:=$values[5]
	$顧客.携帯番号:=$values[6]
	$顧客.メール:=$values[7]
	$顧客.郵便番号:=$values[8]
	$顧客.住所:=$values[9]
	$顧客.住所フリガナ:=$values[10]
	$顧客.save()
	
End for each 
