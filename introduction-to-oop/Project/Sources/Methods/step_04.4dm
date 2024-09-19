//%attributes = {"invisible":true}
//MARK: クラスオブジェクトの型宣言

var $student : cs:C1710.Student

//MARK: インスタンスの作成

$student:=cs:C1710.Student.new()

$student.firstName:="Keisuke"
$student.lastName:="Miyako"
$student.birthday:=!1974-09-22!

//MARK: 継承

$isStudent:=OB Instance of:C1731($student; cs:C1710.Student)
$isPerson:=OB Instance of:C1731($student; cs:C1710.Person)

//MARK: インスタンスのイントロスペクション（内観）

$entries:=OB Entries:C1720($student)
$keys:=OB Keys:C1719($student)

//MARK:クラス自体は共有オブジェクトである（デバッガで開くと良い）

$class:=OB Class:C1730($student)
$superclass:=$class.superclass
$supersuperclass:=$class.superclass.superclass

//MARK:プロトタイプの上書き（オブジェクト指向の精神に反するので非推奨）

Use ($class)
	$class.alert:=Formula:C1597(ALERT:C41($1))
End use 

//%W-550.2
cs:C1710.Student.alert("This is an alert!")
//%W+550.2