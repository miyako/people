//%attributes = {"invisible":true}
//MARK: 抽象オブジェクトの型宣言

var $person : Object

//MARK: インスタンスの作成
//MARK: プロパティの追加

$person:={firstName: Null:C1517; lastName: Null:C1517; birthday: Null:C1517}

//MARK: メンバー関数の実装 Formula
//MARK: インスタンスの自己参照 This

$person.age:=Formula:C1597(Value type:C1509(This:C1470.birthday)=Is date:K8:7 ? 年齢(Current date:C33; This:C1470.birthday) : Null:C1517)

var $age : Variant
$age:=$person.age()  //誕生日が未設定なのでnull

$person.birthday:=!2001-09-03!

$age:=$person.age()  //本日の年齢