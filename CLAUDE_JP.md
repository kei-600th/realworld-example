# CLAUDE.md

このファイルは、リポジトリ内のコードを扱う際に Claude Code (claude.ai/code) へのガイダンスを提供します。

## 概要

RealWorldサンプルアプリケーション（"Conduit" - Medium.comクローン）で、2つのアプリで構成されるモノレポです。

- `react-redux-realworld-example-app/` — フロントエンド（React + Redux）
- `django-realworld-example-app/` — バックエンド（Django REST Framework）

## プロジェクトの起動

### Docker（推奨・両サービス同時起動）

```bash
docker-compose up
# フロントエンド: http://localhost:4100
# バックエンド: http://localhost:8000
```

### フロントエンドのみ

```bash
cd react-redux-realworld-example-app
npm install
npm start        # 開発サーバー（ポート4100）
npm run build    # 本番ビルド
npm test -- --env=jsdom
```

### バックエンドのみ

Python 3.5.2（pyenv経由）が必要です。

```bash
cd django-realworld-example-app/src
pip install -r ../requirements.txt
python manage.py runserver   # ポート8000
```

## アーキテクチャ

### フロントエンド（React + Redux）

**データフロー:** UIコンポーネント → アクションをdispatch → `promiseMiddleware` が非同期API呼び出しを処理 → reducerがstateを更新 → コンポーネントが再レンダリング

主要ファイル:
- `src/index.js` — Reduxストアのセットアップとアプリエントリーポイント
- `src/agent.js` — APIクライアント（Superagent）。`API_ROOT` は `http://localhost:8000/api` にハードコードされている
- `src/reducer.js` — 各スライスreducerを結合: `article`, `articleList`, `auth`, `common`, `editor`, `home`, `profile`, `settings`, `router`
- `src/middleware.js` — `promiseMiddleware`（Promiseペイロードを処理）、`localStorageMiddleware`（JWTを `jwt` キーでlocalStorageに保存）
- `src/components/App.js` — トップレベルのルーティングとJWT初期化

### バックエンド（Django REST Framework）

Djangoプロジェクト名は `conduit`。ソースは `src/` 以下にあります。

`src/conduit/apps/` 以下のアプリ:
- `authentication` — ユーザー登録・ログイン、JWT生成
- `articles` — 記事のCRUD、コメント、タグ
- `profiles` — ユーザープロフィール、フォロー/アンフォロー、お気に入り
- `core` — 共通ベースモデル（`TimestampedModel`）、レンダラー、例外処理

**API** は `/api/` 配下。フロントエンドからのリクエストを許可するためCORSが有効。認証はBearerトークンとして渡すJWTを使用。

**データベース:** 開発環境ではSQLite（`db.sqlite3`）を使用。
