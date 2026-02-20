# Django RealWorld Example App 日本語README

このリポジトリは、RealWorld API仕様に準拠したDjango REST Frameworkのサンプル実装です。CRUD、認証、実運用を意識したパターンを含みます。

## 前提

- Python 3.5.2
- `pyenv` と `pyenv-virtualenv`

## セットアップ

1. リポジトリを取得します。

```bash
git clone git@github.com:gothinkster/productionready-django-api.git
cd productionready-django-api
```

2. Python 3.5.2 と仮想環境を用意します。

```bash
pyenv install 3.5.2
pyenv virtualenv 3.5.2 productionready
pyenv local productionready
pyenv rehash
```

3. 依存関係をインストールします。

```bash
pip install -r requirements.txt
```

## 起動

データベースを初期化してサーバーを起動します。

```bash
python manage.py migrate
python manage.py runserver
```

起動後は `http://127.0.0.1:8000/` でアクセスできます。

## Docker での起動・停止

ローカルに `pyenv` がなくても Docker で起動できます。

1. イメージをビルドします。

```bash
docker build -t realworld-django:pyenv .
```

2. コンテナを起動します。

```bash
docker run -d --name realworld-django -p 8000:8000 realworld-django:pyenv
```

3. 起動ログを確認します。

```bash
docker logs -n 50 realworld-django
```

4. コンテナを停止します。

```bash
docker stop realworld-django
```

5. コンテナを削除します。

```bash
docker rm realworld-django
```

## 開発メモ

- 仮想環境が有効になっていない場合は `pyenv activate productionready` を実行してください。
- RealWorld API仕様: `https://github.com/gothinkster/realworld-example-apps`
