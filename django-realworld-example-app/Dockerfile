FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
# pyenv を固定パスに入れてイメージの構成を安定させる。
ENV PYENV_ROOT=/opt/pyenv
# 以降の RUN で pyenv と shims を使えるようにする。
ENV PATH=${PYENV_ROOT}/bin:${PYENV_ROOT}/shims:$PATH

# pyenv で Python 3.5.2 をビルドするための依存パッケージ。
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    build-essential \
    libssl1.0-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    libffi-dev \
    liblzma-dev \
    tk-dev \
  && rm -rf /var/lib/apt/lists/*

# pyenv と pyenv-virtualenv を導入して仮想環境を作れるようにする。
RUN git clone https://github.com/pyenv/pyenv.git ${PYENV_ROOT} \
  && git clone https://github.com/pyenv/pyenv-virtualenv.git ${PYENV_ROOT}/plugins/pyenv-virtualenv

WORKDIR /app
# リポジトリ一式をイメージにコピーする。
COPY . /app

# Python 3.5.2 をビルドし、仮想環境を作成して依存関係をインストールする。
RUN pyenv install 3.5.2 \
  && pyenv virtualenv 3.5.2 productionready \
  && pyenv local productionready \
  && pyenv rehash \
  && pip install -r requirements.txt

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
# エントリーポイントに実行権限を付与する。
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 8000
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
