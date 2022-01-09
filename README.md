# pandas入門
pandas初心者向けの学習教材です。  
どんどんフォークし、ご自身のグループに合わせた内容にしてご活用ください。

## 事前に必要となる知識
- pandasとは何か？またどんなことができるのか？
- Jupyter NotebookまたはJupyter Labの簡単な操作方法

キノコードさんの以下の動画などはとても分かりやすいのでお薦めです。

__【キノコード / プログラミング学習チャンネル】__
- [Pandas入門｜02.jupyter Labの使い方｜プログラムの記述や実行、表やグラフも表示できるPythonユーザーに人気のツール](https://www.youtube.com/watch?v=iTAgip9aaTY)
- [Pandas入門｜03.Pandasとは?｜できることや使い方をわかりやすく解説します｜できることはCSV操作から人工知能開発まで。](https://www.youtube.com/watch?v=ubJohq5feeY)

## 実行環境の準備
Jupyter NotebookまたはJupyter Labが動く環境があれば、特別な準備は必要ありません。  
`Pipfile`に記載のPythonライブラリを適宜インストールしてください。

`pipenv`で仮想環境を構築してJupyter NotebookまたはJupyter Labを利用する場合は、以下の２つのステップでおこないます。

### Step1. 仮想環境の構築
`pipenv`がない場合はインストール。
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
指定のバージョンのPythonで仮想環境が作られ、各ライブラリもインストールされます。

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

仮想環境へ入ってPythonのバージョンを確認。
```
$ pipenv shell
Launching subshell in virtual environment...

（中略）

(introduction_to_pandas) $ python --version
Python 3.9.7
```

仮想環境を抜けます。
```
(introduction_to_pandas) $ exit
```

### Step2. 仮想環境をJupyter Notebookから利用できるようにする
Jupyter Labの場合もほぼ同じ手順となります。  
適宜読み替えて進めてください。

`introduction_to_pandas`ディレクトリに移動し、仮想環境に入ります。
```
$ cd introduction_to_pandas
$ pipenv shell
```

仮想環境をカーネルに追加。
```
(introduction_to_pandas) $ python -m ipykernel install --user --name=introduction_to_pandas
```

仮想環境を抜けます。
```
(introduction_to_pandas) $ exit
```

Jupyter Notebookの起動。  
以下のコマンドを実行するか、仮想環境に入ったまま`jupyter notebook`を実行してもOKです。
```
$ pipenv run jupyter notebook
```

ブラウザでJupyter Notebookを開いたら、まず任意のノートブックを開きます。  
メニューから「カーネル」→「カーネルの変更」と辿って`introduction_to_pandas`を選択します。

画面右肩のカーネルの表示が`introduction_to_pandas`になっていればOKです。

## 参考資料
下記の資料を参考に作成しました。  
いずれもとても良い内容の書籍ですので、より深くpandasを勉強したい方は是非挑戦してみてください。

- [前処理大全[データ分析のためのSQL/R/Python実践テクニック]](https://www.amazon.co.jp/dp/4774196479/)  
本橋 智光(著), 技術評論社, 2018/4/13

- [データ分析者のためのPythonデータビジュアライゼーション入門 コードと連動してわかる可視化手法 (AI & TECHNOLOGY)](https://www.amazon.co.jp/dp/479816397X/)  
小久保 奈都弥(著), 翔泳社, 2020/8/6

- [Pythonによるデータ分析入門 第2版 ―NumPy、pandasを使ったデータ処理](https://www.amazon.co.jp/dp/487311845X/)  
Wes McKinney(著), 瀬戸山 雅人(翻訳), 小林 儀匡(翻訳), 滝口 開資(翻訳), オライリージャパン, 2018/7/26

- [scikit-learn、Keras、TensorFlowによる実践機械学習 第2版](https://www.amazon.co.jp/dp/4873119286/)  
Aurélien Géron(著), 下田 倫大(監修), 長尾 高弘(翻訳), オライリージャパン, 2020/11/4