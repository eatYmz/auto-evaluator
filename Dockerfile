# 使用官方的 Python 镜像作为基础镜像
FROM python:3.11-slim

# 安装系统依赖库
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    libssl-dev \
    libffi-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    libpq-dev \
    libcurl4-openssl-dev \
    liblapack-dev \
    libblas-dev \
    gfortran \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /app

# 将当前目录下的所有文件复制到工作目录中
COPY . /app

# 安装依赖
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# 暴露 Streamlit 默认的运行端口
EXPOSE 3010

# 运行 Streamlit 应用
CMD ["streamlit", "run", "auto-evaluator.py"]
