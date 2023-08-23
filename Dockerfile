FROM ubuntu
WORKDIR /code

# 替换镜像源
RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
    && sed -i s@/security.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
    && apt-get clean && apt-get update -y

# 编译 nginx 的库 & 工具
RUN apt-get install -y \
	gcc make libz-dev libpcre3-dev libssl-dev \
	gdb vim


