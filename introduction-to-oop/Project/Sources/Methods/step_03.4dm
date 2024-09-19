//%attributes = {"invisible":true}
//継承クラスの型宣言とインスタンス化

var $student : cs:C1710.Student

$student:=cs:C1710.Student.new()

$student.firstName:="Keisuke"
$fullName:=$student.fullName

$student.lastName:="Miyako"
$fullName:=$student.fullName

$student.birthday:=!2007-03-31!

var $yearLevel : cs:C1710.YearLevel

$yearLevel:=$student.yearLevel(!2010-04-01!)
$yearLevel:=$student.yearLevel(!2011-04-01!)
$yearLevel:=$student.yearLevel(!2012-04-01!)
$yearLevel:=$student.yearLevel(!2013-04-01!)
$yearLevel:=$student.yearLevel(!2014-04-01!)
$yearLevel:=$student.yearLevel(!2015-04-01!)
$yearLevel:=$student.yearLevel(!2016-04-01!)
$yearLevel:=$student.yearLevel(!2017-04-01!)
$yearLevel:=$student.yearLevel(!2018-04-01!)
$yearLevel:=$student.yearLevel(!2019-04-01!)
$yearLevel:=$student.yearLevel(!2020-04-01!)
$yearLevel:=$student.yearLevel(!2021-04-01!)
$yearLevel:=$student.yearLevel(!2022-04-01!)

var $currentYearLevel : Text

$currentYearLevel:=$student.currentYearLevel