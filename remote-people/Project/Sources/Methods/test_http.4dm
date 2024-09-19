//%attributes = {}
$URL:="http://127.0.0.1/findPeople?name="+url_escape("@あ@")

var $status : Integer
var $response : Object

HTTP AUTHENTICATE:C1161("people"; "morioka"; HTTP digest:K71:9)

$status:=HTTP Get:C1157($URL; $response)