//%attributes = {}
$顧客:=ds:C1482.顧客.all().at(0)

$商品別販売実績:=$顧客.商品別販売実績("Apples")
$月別販売実績:=$顧客.月別販売実績(6)

/*

6月中にバナナを1度に5本以上購入した顧客

*/

$販売:=ds:C1482.販売.query("販売月 == :1 and 商品.商品名 == :2 and 数 >= :3"; 6; "Bananas"; 5)
$情報:=$販売.extract("販売月"; "販売月"; "商品.商品名"; "商品名"; "数"; "数"; "顧客.表示名"; "顧客")

/*

日付の月で検索

*/

$販売:=ds:C1482.販売.query("販売月 == :1 and 商品.商品名 == :2"; 6; "Bananas")
$情報:=$販売.extract("販売月"; "販売月"; "商品.商品名"; "商品名"; "数"; "数"; "顧客.表示名"; "顧客")

/*

商品名がn文字以上の商品
*/

//#1: Formula()に引数を埋め込む例題
$length:=5
$f:=Formula:C1597(Length:C16(This:C1470.商品名)<=$length)
$es:=ds:C1482.商品.query(":1"; $f)

//#2: Formula()で引数を参照する例題
$queryParams:={}
$queryParams.args:={}
$queryParams.args.length:=5  //引数

$f:=Formula:C1597(Length:C16(This:C1470.商品名)<=$1.length)
$es:=ds:C1482.商品.query(":1"; $f; $queryParams)

//#3: Formula()を使わずに引数を記述する例題
$es:=ds:C1482.商品.query("eval(Length(This.商品名)<=5)")

/*

バナナとリンゴを購入した顧客
{n}記法の例題

*/

$顧客:=ds:C1482.顧客.query("販売.商品.商品名 = :1 and 販売.商品{2}.商品名 = :2"; "apples"; "bananas")

/*

クエリパスとクエリプランの例題

*/

$queryParams:={}
$queryParams.queryPlan:=True:C214
$queryParams.queryPath:=True:C214
$販売:=ds:C1482.販売.query("(日付>=:1 and 日付<=:2) and (商品.商品名==:3) and (数>=:4)"; !2024-06-01!; !2024-06-30!; "bananas"; 3; $queryParams)
SET TEXT TO PASTEBOARD:C523(JSON Stringify:C1217($販売.queryPath; *))

