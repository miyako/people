//%attributes = {"invisible":true}
var $conectionInfo : Object

$conectionInfo:={}
$conectionInfo.hostname:="localhost"
$conectionInfo.user:="designer"
$conectionInfo.password:=""

var $localId : Text

$localId:="people@localhost"

$ds:=Open datastore:C1452($conectionInfo; $localid)

$ds:=ds:C1482("people@localhost")

$params:={token: "givemeaccess"; privileges: "people"}

$status:=$ds.authentify($params)

If ($status.success)
	
	$顧客:=$ds.顧客.query("名前フリガナ == :1"; "@い")
	
End if 