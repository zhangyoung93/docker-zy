#指定基础镜像，必须放到dockerfile开头
FROM redis:7.2-alpine

#声名镜像基本信息，展示用。
LABEL maintainer="zy"

#接收compose build args传递的参数
ARG REDIS_HOME

#工作目录
WORKDIR ${REDIS_HOME}

#设置容器内的环境变量，多个环境变量换行可用\分割
ENV REDIS_HOME=${REDIS_HOME}
ENV TZ=Asia/Shanghai

#镜像构建命令，推荐使用&&合并命令
RUN mkdir -p ${REDIS_HOME}/data \
    && chown -R redis:redis ${REDIS_HOME} \
    && chmod -R 775 ${REDIS_HOME}

#从宿主机复制配置文件到容器
COPY conf/redis.conf ${REDIS_HOME}/redis.conf
COPY conf/sentinel.conf ${REDIS_HOME}/sentinel.conf
#COPY bin/redis-start.sh ${REDIS_HOME}/bin/redis-start.sh

#最后赋权。记得处理windows换行符，不然会找不到shell文件
RUN chown -R redis:redis ${REDIS_HOME} \
    && chmod -R 775 ${REDIS_HOME}
    #&& sed -i 's/\r$//' ${REDIS_HOME}/bin/redis-start.sh

#Alpine镜像安装tzdate时区依赖
RUN apk add --no-cache tzdata \
    && ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone

#声名容器暴露的端口，具体实现需添加映射关系
#EXPOSE ${REDIS_HOST_PORT}

#用户从root切换到redis，避免使用root运行，redis官方镜像默认用redis用户运行。
USER redis

#容器启动辅助命令或参数，可被docker run覆盖。可定义多次，但只有最后一个CMD生效
#CMD ["/usr/local/redis/bin/redis-start.sh"]

#容器启动主命令，可配合CMD使用，不会被覆盖。只能定义一次。
#ENTRYPOINT

#声名匿名卷，运行时自动挂载到宿主机，避免容器内数据丢失。
#VOLUME
