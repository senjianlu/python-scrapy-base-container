# 基础镜像为 Python3.11-slim
FROM python:3.11-slim

# 维护者信息
LABEL maintainer="Rabbir admin@cs.cheap"

# Docker 内用户切换到 root
USER root

# 设置时区为东八区
ENV TZ Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime > /etc/timezone

# 创建和设置工作目录
RUN mkdir -vp /root/python-scrapy-base-container
WORKDIR /root/python-scrapy-base-container

# 复制当前目录下的所有文件到 Docker 容器中
COPY . /root/python-scrapy-base-container

# 安装依赖
RUN pip3 install -r requirements.txt

# 启动命令
WORKDIR /root/python-scrapy-base-container
ENTRYPOINT ["echo", "Done!"]
