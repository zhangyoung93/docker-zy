#!/bin/sh

#设置脚本执行过程中发生错误时立即终止运行
set -e

#解析变量
exec redis-server ${REDIS_HOME}/redis.conf --requirepass ${REDIS_PASSWORD}