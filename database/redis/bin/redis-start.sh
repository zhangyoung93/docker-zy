##!/bin/sh
#
##设置脚本执行过程中发生错误时立即终止运行
#set -e
#
##redis启动辅助命令
#redis_server_cmd=${REDIS_HOME}/redis.conf --requirepass ${REDIS_PASSWORD}
#
##MASTER节点信息不为空则拼接命令
#if [-n ${REDIS_MASTER_NODE}]
#then
#  redis_server_cmd=" --replicaof "${REDIS_MASTER_NODE}
#
##解析变量
#exec redis-server ${redis_server_cmd}