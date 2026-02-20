# ![React + Redux Example App](project-logo.png)

[![RealWorld Frontend](https://img.shields.io/badge/realworld-frontend-%23783578.svg)](http://realworld.io)

> ### RealWorld の仕様と API に準拠した、実用的な例（CRUD、認証、高度なパターンなど）を含む React + Redux のコードベースです。

<a href="https://stackblitz.com/edit/react-redux-realworld" target="_blank"><img width="187" src="https://github.com/gothinkster/realworld/blob/master/media/edit_on_blitz.png?raw=true" /></a>&nbsp;&nbsp;<a href="https://thinkster.io/tutorials/build-a-real-world-react-redux-application" target="_blank"><img width="384" src="https://raw.githubusercontent.com/gothinkster/realworld/master/media/learn-btn-hr.png" /></a>

### [デモ](https://react-redux.realworld.io)&nbsp;&nbsp;&nbsp;&nbsp;[RealWorld](https://github.com/gothinkster/realworld)

元々はこの [GH issue](https://github.com/reactjs/redux/issues/1353) のために作成されました。現在、このコードベースは機能的に完成しています。バグ修正は pull request で、フィードバックは issue でお寄せください。

また、このコードベースで使われている各種パターンとその仕組みについてのメモを [**Wiki**](https://github.com/gothinkster/react-redux-realworld-example-app/wiki) にまとめています（[@thejmazz](https://github.com/thejmazz) に感謝！）。


## はじめに

ライブデモは https://react-redux.realworld.io/ で確認できます。

ローカルでフロントエンドを起動するには：

- このリポジトリをクローン
- `npm install` で依存関係をインストール
- `npm start` でローカルサーバーを起動（このプロジェクトは create-react-app を使用）

ローカルの Web サーバーは、Node や Rails など一部のバックエンドとの競合を避けるため、標準の React のポート 3000 ではなく 4100 を使用します。ポートは `package.json` の scripts セクションで設定できます。ここでは環境変数 `PORT` を設定するために [cross-env](https://github.com/kentcdodds/cross-env) を使っています（Windows 互換の方法）。

### Docker での起動

Docker で `npm install` と `npm start` を実行できるように、`Dockerfile` とリポジトリルートの `docker-compose.yml` を用意しています（バックエンドと同時起動）。

- リポジトリルートで `docker compose build` を実行
- 続けて `docker compose up` で起動（初回はコンテナ内で `npm install` が実行されます）

ブラウザで `http://localhost:4100` にアクセスしてください。

または、プロジェクトのルートに `.env` ファイルを追加して環境変数を設定することもできます（`PORT` を使って Web サーバーのポートを変更）。このファイルは git から無視されるため、API キーなどの機密情報を入れるのに適しています。詳しくは [dotenv](https://github.com/motdotla/dotenv) と [React のドキュメント](https://github.com/facebookincubator/create-react-app/blob/master/packages/react-scripts/template/README.md#adding-development-environment-variables-in-env) を参照してください。なお、`dotenv` は既に設定されている変数を上書きしないため、`package.json` の scripts セクションでの設定は削除してください。

### バックエンド API へのリクエスト

アプリがリクエストを送る先として、利便性のために https://conduit.productionready.io/api で稼働中の API サーバーを用意しています。サーバーのルートとレスポンスは [API 仕様](https://github.com/GoThinkster/productionready/blob/master/api) で確認できます。

バックエンドサーバーのソースコード（Node、Rails、Django 版）は [RealWorld のメインリポジトリ](https://github.com/gothinkster/realworld) にあります。

API の URL をローカルサーバーに変更したい場合は、`src/agent.js` を編集し、`API_ROOT` をローカルの URL（例: `http://localhost:3000/api`）に変更してください。


## 機能概要

このサンプルアプリケーションは「Conduit」というソーシャルブログサイト（Medium.com のクローン）です。すべてのリクエスト（認証を含む）にカスタム API を使用しています。ライブデモは https://redux.productionready.io/ で確認できます。

**一般的な機能:**

- JWT によるユーザー認証（ログイン/サインアップ + 設定ページのログアウト）
- ユーザーの CRU*（サインアップ & 設定ページ - 削除は不要）
- 記事の CRUD
- 記事コメントの CR*D（更新は不要）
- 記事一覧のページネーション取得と表示
- 記事のお気に入り
- 他ユーザーのフォロー

**ページ構成の概要:**

- ホームページ（URL: /#/ ）
    - タグ一覧
    - Feed / Global / タグ別から記事を取得して表示
    - 記事一覧のページネーション
- サインイン/サインアップページ（URL: /#/login, /#/register ）
    - JWT を使用（トークンは localStorage に保存）
- 設定ページ（URL: /#/settings ）
- 記事作成/編集ページ（URL: /#/editor, /#/editor/article-slug-here ）
- 記事ページ（URL: /#/article/article-slug-here ）
    - 記事の削除ボタン（著者のみ表示）
    - サーバーからの Markdown をクライアント側でレンダリング
    - ページ下部にコメント欄
    - コメント削除ボタン（著者のみ表示）
- プロフィールページ（URL: /#/@username, /#/@username/favorites ）
    - ユーザー基本情報の表示
    - 作成した記事、またはお気に入りした記事の一覧

<br />

[![Brought to you by Thinkster](https://raw.githubusercontent.com/gothinkster/realworld/master/media/end.png)](https://thinkster.io)
