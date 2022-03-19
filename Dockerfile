FROM python:3.9.10-slim-buster

# OSのパッケージを取得
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    chromium \
    locales \
    fonts-takao-gothic \
    fonts-takao-mincho \
    git \
    wget \
    unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# OSの言語設定
RUN locale-gen ja_JP.UTF-8
RUN localedef -f UTF-8 -i ja_JP ja_JP
ENV LANG ja_JP.UTF-8  
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

WORKDIR /app

# コードを取得
RUN git clone https://github.com/hosaka893/introduction_to_pandas.git

WORKDIR /app/introduction_to_pandas

# pythonパッケージを取得
RUN pip install --upgrade pip && pip install pipenv
RUN pipenv install --dev --skip-lock --ignore-pipfile

# ipykernelのインストール
RUN pipenv run python -m ipykernel install --user --name=introduction_to_pandas

# ChromeDriverを配置
RUN wget https://chromedriver.storage.googleapis.com/90.0.4430.24/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip && rm chromedriver_linux64.zip
RUN chmod 755 chromedriver && mv chromedriver 04_*/lib/

# jupyter notebookの起動
CMD pipenv run jupyter notebook --port=8888 --no-browser --allow-root --ip=* --NotebookApp.token=''
