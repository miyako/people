//%attributes = {"invisible":true}
//MARK: クラスオブジェクトの型宣言

var $person : Object
//var $person : cs.Person

//MARK: インスタンスの作成

$person:=cs:C1710.Person.new()

//MARK: 型宣言でコード補完の候補が変わる

$person.birthday:=!2001-09-03!

//MARK: 読み取り専用プロパティ getter

$age:=$person.age

$person.birthday+=300

$person.firstName:="Keisuke"
$fullName:=$person.fullName

$person.lastName:="Miyako"
$fullName:=$person.fullName