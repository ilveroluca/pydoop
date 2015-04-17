#!/bin/bash

export HADOOP_LOG_DIR=${HDFS_LOG_DIR}
export HADOOP_PID_DIR=${HDFS_PID_DIR}

HADOOP_BIN=${HADOOP_HOME}/bin


# su ${HDFS_USER} -c "${HADOOP_BIN}/hdfs dfs -mkdir -p ${YARN_REMOTE_APP_LOG_DIR}"
# su ${HDFS_USER} -c "${HADOOP_BIN}/hdfs dfs -chown -R ${YARN_USER}:${HADOOP_GROUP} ${YARN_REMOTE_APP_LOG_DIR}"
# su ${HDFS_USER} -c "${HADOOP_BIN}/hdfs dfs -chmod -R ${YARN_REMOTE_APP_LOG_DIR}"

#for d in ${MAPRED_JH_DONE_DIR} ${MAPRED_JH_INTERMEDIATE_DONE_DIR}
# do
#     su ${HDFS_USER} -c "${HADOOP_BIN}/hdfs dfs -mkdir -p ${d}"
#     su ${HDFS_USER} -c "${HADOOP_BIN}/hdfs dfs -chown -R ${MAPRED_USER}:${HADOOP_GROUP} ${d}"
#     su ${HDFS_USER} -c "${HADOOP_BIN}/hdfs dfs -chmod -R 777 ${d}"
# done

su ${HDFS_USER} -c "${HADOOP_BIN}/hdfs dfs -mkdir -p /tmp"
su ${HDFS_USER} -c "${HADOOP_BIN}/hdfs dfs -chmod -R 1777 /tmp"

su ${HDFS_USER} -c "${HADOOP_BIN}/hdfs dfs -mkdir -p /user/${UNPRIV_USER}"
su ${HDFS_USER} -c "${HADOOP_BIN}/hdfs dfs -chown ${UNPRIV_USER} /user/${UNPRIV_USER}"

su ${HDFS_USER} -c "${HADOOP_BIN}/hdfs dfs -mkdir -p /user/${MAPRED_USER}"
su ${HDFS_USER} -c "${HADOOP_BIN}/hdfs dfs -chown ${MAPRED_USER} /user/${MAPRED_USER}"
su ${MAPRED_USER} -c "${HADOOP_BIN}/hdfs dfs -mkdir /user/${MAPRED_USER}/logs"
