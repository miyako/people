//%attributes = {"invisible":true}
#DECLARE($searchword : Text) : Collection

ARRAY TEXT:C222($names; 0)
WEB SERVICE SET PARAMETER:C777("searchword"; $searchword)
WEB SERVICE CALL:C778("http://localhost/4DSOAP/"; "A_WebService#findPeople"; "findPeople"; "http://www.4d.com/namespace/default"; Web Service dynamic:K48:1)

If (OK=1)
	WEB SERVICE GET RESULT:C779($names; "names"; *)
End if 

$collection:=[]
ARRAY TO COLLECTION:C1563($collection; $names)

return $collection