# 使用官方的 Python 镜像作为基础镜像
FROM python:3.11-slim

# 设置工作目录
WORKDIR /app

# 将当前目录下的所有文件复制到工作目录中
COPY . /app

# 安装依赖
RUN pip install --no-cache-dir -r requirements.txt

# 暴露 Streamlit 默认的运行端口
EXPOSE 3010

# 运行 Streamlit 应用
CMD ["streamlit", "run", "auto-evaluator.py"]
