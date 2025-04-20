📁 ① VSCode でプロジェクトフォルダを開く

code /Users/gota/docker/hamster_breeding_project

🔑 ② .env ファイルによる環境変数管理（秘匿性UP）

.envファイル（例）：
OPENAI_API_KEY=sk-XXX
PINECONE_API_KEY=pcsk_XXX

🧠 ③ コンテナの中で Jupyter を構築する
以下のように docker run コマンドで VSCode からもアクセスできるようにします：

# Jupyter Notebookとして起動（ポートフォワードも忘れずに）
docker run -it -p 8888:8888 --name hamster-rag \
  --env-file .env \
  -v $(pwd):/app \
  hamster-rag


次回からは以下でコンテナを再起動👇
docker start -ai hamster-rag



起動後のログの最後に：
  http://127.0.0.1:8888/?token=abc123...
のようなURLが出てきたら、そのURLを コピーしておきます（VSCodeで使います）。



🧪 ④ VSCode で .ipynb を開く
chunk_text.ipynb をダブルクリックで開きます。

Notebook 上部に表示される カーネル選択バーで「既存のJupyterサーバーに接続」を選択。

先ほどコピーした http://127.0.0.1:8888/... を貼り付け。

✅ 「接続できません」となる場合は http://localhost:8888/?token=... に変えてみてください。