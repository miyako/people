//%attributes = {"invisible":true}
var $person : cs:C1710.Person

$person:=cs:C1710.Person.new()

$person.firstName:="Keisuke"
$person.lastName:="Miyako"
$person.birthday:=!1974-09-22!

$fullName:=$person.fullName

var $contact : cs:C1710.Contact

$contact:=cs:C1710.Contact.new()

$contact.firstName:="ケイスケ"
$contact.lastName:="宮古"
$contact.birthday:=!1974-09-22!

//継承クラスで実装をオーバーライド

$fullName:=$contact.fullName

$contact.lastNameFirst:=False:C215

$fullName:=$contact.fullName