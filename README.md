# トレーニング@滝沢市IPUイノベーションセンター

#### サンプルデータベースアプリケーション

* インポート用データファイル（顧客・ヘッダー行あり）
 * [data.txt](https://github.com/miyako/people/releases/tag/data.txt)
* インポート用データファイル（商品・ヘッダー行なし）
 * [products.txt](https://github.com/miyako/people/releases/tag/products.txt)
* インポート済データファイル
 * [people.4DD](https://github.com/miyako/people/releases/tag/people.4DD) 

#### 例題いろいろ

* [Google Mapsと連携](https://github.com/miyako/4d-topic-google-maps)
* [OpenAIと連携](https://github.com/miyako/4d-class-openai)
* [SVGでハガキ出力](https://github.com/miyako/4d-tips-print-with-svg)
* [よみがな取得](https://github.com/miyako/4d-plugin-x-phonetic)
* [Macで顔認証](https://github.com/miyako/4d-plugin-x-phonetic)
* [WebSocketsクライアントで暗号通過の価格を受信](https://github.com/miyako/4d-class-websocket-client)
* [WebSocketsサーバーでチャット](https://github.com/miyako/4d-class-websocket-server)

#### リモートプロシージャーコールの例題`3`種

* [Open datastore](https://developer.4d.com/docs/ja/API/DataStoreClass/#open-datastore)
  * サーバーは4D Developer Professionalまたは4D Server
  * サーバーはREST公開を有効にする
  * サーバーはHTTPサーバーを起動にする
  * サーバーは`roles.json`で権限を設定する
  * サーバーは`ds.authentify`を実装する
    * [呼び出し](https://github.com/miyako/people/blob/main/remote-people/Project/Sources/Methods/test_ds.4dm)
* [SOAP (Web Services)](https://doc.4d.com/4Dv20R5/4D/20-R5/Web-Services-Server.201-6817265.ja.html)
  * サーバーはメソッドをWebサービスで公開する
  * サーバーはメソッドをWSDLで公開する
  * サーバーは入出力パラメーターを宣言する
  * サーバーは出力パラメーターにプロセス変数を使用する
  * サーバーはHTTPサーバーを起動にする
  * クライアントはWebサービスウィザードでプロキシメソッドを作成する
    * [呼び出し](https://github.com/miyako/people/blob/main/remote-people/Project/Sources/Methods/proxy_findPeople.4dm)
* [HTTP (Web Server)](https://doc.4d.com/4Dv20R5/4D/20-R5/4D-Language-Reference.100-6817247.ja.html)
  * サーバーはHTTPサーバーを起動にする
  * サーバーは`On Web Authentication`で認証する
  * 認証モードは`BASIC`または`DIGEST`（デザイン/設定…）
  * `DIGEST`の場合は`WEB Validate digest`で認証する
  * セッション管理モードは「なし」「旧式」「スケーラブル」
  * `Session`を利用できるのは「スケーラブル」
  * サーバーは`On Web Connection`でリクエストを処理する
    * [呼び出し](https://github.com/miyako/people/blob/main/remote-people/Project/Sources/Methods/test_http.4dm)
