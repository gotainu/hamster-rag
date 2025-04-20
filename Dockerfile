FROM python:3.10-slim

WORKDIR /app

# 必要なファイルをコピー
COPY requirements.txt .
COPY chunk_text.ipynb .
COPY senarios/ ./senarios/

# Linuxベースの信頼性強化
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# 一括で依存関係をインストール
RUN pip install --upgrade pip && \
    pip install -r requirements.txt && \
    python -m nltk.downloader punkt

# Jupyter起動（任意で調整）
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]
