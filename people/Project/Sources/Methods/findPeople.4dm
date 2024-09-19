//%attributes = {"invisible":true,"publishedSoap":true,"publishedWsdl":true}
C_TEXT:C284($1)

SOAP DECLARATION:C782($1; Is text:K8:3; SOAP input:K46:1; "searchword")
SOAP DECLARATION:C782(名前; Text array:K8:16; SOAP output:K46:2; "names")

$顧客:=ds:C1482.顧客.query("名前 == :1 or 名前フリガナ == :1"; "@"+$1+"@")

ARRAY TEXT:C222(名前; 0)
COLLECTION TO ARRAY:C1562($顧客.名前; 名前)