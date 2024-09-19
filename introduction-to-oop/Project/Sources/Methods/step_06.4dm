//%attributes = {"invisible":true}
var $student : cs:C1710.Student

$student:=cs:C1710.Student.new()

$student.firstName:="Keisuke"
$student.lastName:="Miyako"
$student.birthday:=!1974-09-22!

//MARK: プロトタイプをデータベースに保存

var $ePEOPLE : cs:C1710.PEOPLEEntity

$ePEOPLE:=ds:C1482.PEOPLE.new()
$ePEOPLE.object:=$student
$ePEOPLE.save()
$ID:=$ePEOPLE.getKey(dk key as string:K85:16)

$ePEOPLE:=ds:C1482.PEOPLE.get($ID)

$student:=$ePEOPLE.object

$isStudent:=OB Instance of:C1731($student; cs:C1710.Student)
$isPerson:=OB Instance of:C1731($student; cs:C1710.Person)

$class:=OB Class:C1730($student)
$superclass:=$class.superclass
$supersuperclass:=$class.superclass.superclass
