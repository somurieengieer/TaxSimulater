#!/bin/bash
# 全コンテナ一括削除
docker system prune
docker rm -f `docker ps -a -q`
# 不要なappのpidファイルが残っている場合削除
PID_FILEe="tmp/pids/server.pid"
if [ -e $PID_FILE ]; then
  rm $PID_FILE
  echo rm $PID_FILE
fi
# 初回のみでOK（rails new でDockerコンテナの中にスケルトン作成（新規プロジェクトの場合のみ））
#docker-compose run app rails new . --force --database=mysql
docker-compose build --no-cache
docker-compose run app rake db:create
docker-compose up 
