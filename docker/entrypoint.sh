#! /bin/bash
./docker/wait-for.sh -t 0 db:3306 --strict -- echo "Database Engine is up"
rails db:exists && rails db:migrate || rails db:create db:migrate

export SECRET_KEY_BASE=$(rake secret)

FILE=/app/tmp/pids/server.pid

if test -f "$FILE"; then
  rm $FILE
fi

puma -C config/puma.rb
