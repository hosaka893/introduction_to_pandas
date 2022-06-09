# pandas入門
pandas初心者向けの学習教材です。  
どんどんフォークして、ご自身のグループに合わせた内容にしてご活用ください。

## 1. 事前に必要となる知識
- pandasとは何か？またどんなことができるのか？
- Jupyter NotebookまたはJupyter Labの簡単な操作方法

キノコードさんの以下の動画などはとても分かりやすいのでお薦めです。

__【キノコード / プログラミング学習チャンネル】__
- [Pandas入門｜02.jupyter Labの使い方｜プログラムの記述や実行、表やグラフも表示できるPythonユーザーに人気のツール](https://www.youtube.com/watch?v=iTAgip9aaTY)
- [Pandas入門｜03.Pandasとは?｜できることや使い方をわかりやすく解説します｜できることはCSV操作から人工知能開発まで。](https://www.youtube.com/watch?v=ubJohq5feeY)

## 2. 実行環境の構築
Jupyter NotebookまたはJupyter Labが動く環境があれば、特別な準備は必要ありません。  
`Pipfile`に記載のバージョンのPythonやパッケージを適宜インストールしてください。

適当な環境がない場合、以下のDockerまたはPipenvによる実行環境を構築してください。  
いずれかの環境でjupyterを起動後、構築した仮想環境をカーネルに設定します。

### 2-1. Dockerによるローカル環境構築
ローカルPC上でjupyterを１つだけ起動します。

Dockerがない場合はインストール。  
[Docker Desktop - Docker](https://www.docker.com/products/docker-desktop/)

リポジトリをクローン。
```
$ git clone https://github.com/hosaka893/introduction_to_pandas.git
```

`introduction_to_pandas/docker`ディレクトリに移動。
```
$ cd introduction_to_pandas/docker
```

Dockerイメージの作成。  
最後の「.」を忘れないようにしてビルドを実行します。
```
$ docker build -t my_introduction_to_pandas .
```

Dockerコンテナを起動。  
ここでは5000番ポートでブラウザからアクセスすることとします。
```
$ docker container run -it -p5000:8888 my_introduction_to_pandas
```

ブラウザで以下のページにアクセスします。  
http://localhost:5000/

ブラウザでJupyter Notebookを開いたら、まず任意のノートブックを開きます。  
メニューから「カーネル」→「カーネルの変更」と辿って`introduction_to_pandas`を選択します。

画面右肩のカーネルの表示が`introduction_to_pandas`になっていればOKです。

### 2-2. Dockerによるサーバー環境構築
複数のユーザーが利用できるよう、サーバー上で複数のjupyterを起動します。

Dockerがない場合はインストール。   
[Install Docker Engine | Docker Documentation](https://docs.docker.com/engine/install/)

Docker Compose v1がない場合はインストール。  
v2ではコンテナごとに異なるホスト側ポートが割り当てられません。  
[compose/INSTALL.md at master · docker/compose · GitHub](https://github.com/docker/compose/blob/master/INSTALL.md)

なお、ARM64のAmazon Linux 2上でインストールする場合は、以下の手順でインストールしてください。  
参考：https://gist.github.com/npearce/6f3c7826c7499587f00957fee62f8ee9?permalink_comment_id=3700256#gistcomment-3700256

```
$ sudo curl -L --fail https://raw.githubusercontent.com/linuxserver/docker-docker-compose/master/run.sh -o /usr/local/bin/docker-compose

$ sudo chmod +x /usr/local/bin/docker-compose

$ docker-compose --version
```

リポジトリをクローン。
```
$ git clone https://github.com/hosaka893/introduction_to_pandas.git
```

`introduction_to_pandas/docker`ディレクトリに移動。
```
$ cd introduction_to_pandas/docker
```

`docker-compose.yml`を編集し、`notebook`サービスのホスト側ポートの範囲を指定します。  
ここでは3つのコンテナ用にホスト側ポート8080〜8082を解放することにします。  

AWSを利用する場合、セキュリティグループのインバウンドルールで指定した範囲のポートを解放する必要があります。
```
ports:
  - "8080-8082:8888"
```

Dockerコンテナを起動。  
3つのコンテナを起動するので、`scale`コマンドに`notebook=3`と指定します。
```
$ docker-compose up -d --scale notebook=3
```

ブラウザで以下のページにアクセスします。  
- https://<サーバーのドメイン名>:8080/  
- https://<サーバーのドメイン名>:8081/  
- https://<サーバーのドメイン名>:8082/

ブラウザでJupyter Notebookを開いたら、まず任意のノートブックを開きます。  
メニューから「カーネル」→「カーネルの変更」と辿って`introduction_to_pandas`を選択します。

画面右肩のカーネルの表示が`introduction_to_pandas`になっていればOKです。

### 2-3. Pipenvによるローカル環境構築
ローカルPC上でjupyterを１つだけ起動します。

Pipenvがない場合はインストール。
```
$ pip install pipenv
```

リポジトリをクローン。
```
$ git clone https://github.com/hosaka893/introduction_to_pandas.git
```

`introduction_to_pandas`ディレクトリに移動。
```
$ cd introduction_to_pandas
```

`Pipfile.lock`を読み込んで環境を再現。  
指定のバージョンのPythonで仮想環境が作られ、そこに各パッケージもインストールされます。

macでscipyをインストールする際にエラーが出る場合は、事前に`export SYSTEM_VERSION_COMPAT=1`を実行します。  
参考：[Unable to install scipy on macOS Big Sur (Intel hardware) #13102](https://github.com/scipy/scipy/issues/13102)
```
$ pipenv sync --dev
```

`Pipfile`に新しいパッケージを追加した際は以下を実行してインストールします。  
`Pipfile.lock`も更新されます。
```
$ pipenv install --dev
```

仮想環境をJupyter Notebookで利用できるようカーネルを追加します。
```
$ pipenv run python -m ipykernel install --user --name=introduction_to_pandas
```

Jupyter Notebookを起動。  
デフォルトブラウザでページが自動で開きます。
```
$ pipenv run jupyter notebook
```

ブラウザでJupyter Notebookを開いたら、まず任意のノートブックを開きます。  
メニューから「カーネル」→「カーネルの変更」と辿って`introduction_to_pandas`を選択します。

画面右肩のカーネルの表示が`introduction_to_pandas`になっていればOKです。

## 3. 参考資料
下記の資料を参考に作成しました。  
いずれもとても良い書籍ですので、より深くpandasを勉強したい方は是非挑戦してみてください。

- [前処理大全[データ分析のためのSQL/R/Python実践テクニック]](https://www.amazon.co.jp/dp/4774196479/)  
本橋 智光(著), 技術評論社, 2018/4/13

- [Pythonによるデータ分析入門 第2版 ―NumPy、pandasを使ったデータ処理](https://www.amazon.co.jp/dp/487311845X/)  
Wes McKinney(著), 瀬戸山 雅人(翻訳), 小林 儀匡(翻訳), 滝口 開資(翻訳), オライリージャパン, 2018/7/26

- [データ分析者のためのPythonデータビジュアライゼーション入門 コードと連動してわかる可視化手法 (AI & TECHNOLOGY)](https://www.amazon.co.jp/dp/479816397X/)  
小久保 奈都弥(著), 翔泳社, 2020/8/6