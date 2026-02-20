#!/usr/bin/env bash
# Docker 内で Django を起動するためのエントリーポイント。
set -euo pipefail

cd /app
# pyenv 管理の仮想環境を有効化する。
pyenv global productionready
# 起動時にマイグレーションを適用する。
python manage.py migrate
# Docker のポート公開のため全インターフェースで起動する。
python manage.py runserver 0.0.0.0:8000
