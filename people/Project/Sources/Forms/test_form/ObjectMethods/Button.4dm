$queryParams:={}
$queryParams.queryPlan:=True:C214
$queryParams.queryPath:=True:C214

Form:C1466.販売:=ds:C1482.販売.query("(日付>=:1 and 日付<=:2) and (商品.商品名==:3) and (数>=:4)"; !2024-06-01!; !2024-06-30!; "bananas"; 3; $queryParams)