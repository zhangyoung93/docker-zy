#指定基础镜像，必须放到dockerfile开头
FROM nacos/nacos-server:v3.1.1

#声名镜像基本信息，展示用。
LABEL maintainer="zy"

#使用默认目录
ARG NACOS_HOME=/home/nacos

#工作目录
WORKDIR ${NACOS_HOME}

#设置容器内的环境变量，多个环境变量换行可用\分割
ENV NACOS_HOME=${NACOS_HOME}
#nacos启动模式
ENV MODE=standalone
#鉴权令牌，Base64
ENV NACOS_AUTH_TOKEN=zpSzHCDzoDj45TNwNexez2MvzFOGxfIMU6hcbDruI1k
#身份校验key-value
ENV NACOS_AUTH_IDENTITY_KEY=app
ENV NACOS_AUTH_IDENTITY_VALUE=zy
#初始堆内存
ENV JVM_XMS=512m
#最大堆内存
ENV JVM_XMX=512m

#从宿主机复制配置文件到容器
COPY conf/application.properties ${NACOS_HOME}/conf/application.properties

#CentOS镜像设置时区
RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone
