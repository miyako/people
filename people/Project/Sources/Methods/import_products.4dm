//%attributes = {"invisible":true}
SET DATABASE PARAMETER:C642([商品:2]; Table sequence number:K37:31; 0)

var $folder : 4D:C1709.Folder
var $file : 4D:C1709.File

$folder:=Folder:C1567(fk desktop folder:K87:19)
$file:=$folder.file("products.txt")

$text:=$file.getText("utf-8"; Document with CR:K24:21)
var $values : Collection

For each ($line; Split string:C1554($text; "\r"; sk ignore empty strings:K86:1))
	$values:=Split string:C1554($line; "\t")
	
	var $商品 : cs:C1710.商品Entity
	
	$商品:=ds:C1482.商品.new()
	
	$商品.商品名:=$values[0]
	$商品.価格:=Num:C11($values[1])
	
	$商品.save()
	
End for each 