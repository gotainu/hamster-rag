📁 ① VSCode でプロジェクトフォルダを開く

code /Users/gota/docker/hamster_breeding_project

🔑 ② .env ファイルによる環境変数管理（秘匿性UP）

.envファイル（例）：
OPENAI_API_KEY=sk-XXX
PINECONE_API_KEY=pcsk_XXX

🧠 ③ コンテナの中で Jupyter を構築する
以下のように docker run コマンドで VSCode からもアクセスできるようにします：

### Jupyter Notebookとして起動（ポートフォワードも忘れずに）
- Docker Image を構築する。
    - ❯ docker build -t hamster-chunk-text .
- Docker Container を使う
    - ❯ docker run -it -p 8888:8888 --name hamster-chunk-text \
  --env-file .env \
  -v $(pwd)/senarios:/app/senarios \
  hamster-chunk-text


次回からは以下でコンテナを再起動👇
docker start -ai hamster-chunk-text

🧪 ④ VSCode で .ipynb を開く

- ターミナル上でDocker Container をrunしたあとに出てくる以下のログをコピーしておく。
    - [I 2025-05-02 08:59:45.108 ServerApp] http://127.0.0.1:8888/tree
- VSCode で、chunk_text.ipynb をダブルクリックで開き、

    Notebook 上部に表示される カーネル選択バーで「既存のJupyterサーバーに接続」を選択し、

    先ほどコピーした http://127.0.0.1:8888/... を貼り付ける。


✅ 「接続できません」となる場合は http://localhost:8888/?token=... に変えてみてください。