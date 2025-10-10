# syntax=docker/dockerfile:1
FROM python:3.10-slim

# 让 Python 不写 pyc，日志直接刷到控制台
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# 工作目录
WORKDIR /app

# 先拷贝依赖清单并安装
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# 再拷贝应用代码
COPY . /app

# Flask 相关环境变量（如你的 app 文件不是 app.py，请改成对应名字）
ENV FLASK_APP=app.py \
    FLASK_RUN_HOST=0.0.0.0 \
    FLASK_RUN_PORT=5000

# 暴露 Flask 端口
EXPOSE 5000

# 启动命令（开发/教学友好）
CMD ["flask", "run"]
