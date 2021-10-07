#! /bin/bash
./docker/wait-for.sh -t 0 db:3306 --strict -- echo "Database Engine is up"
bundle install --jobs 20 --retry 5
rails db:exists && rails db:migrate || rails db:create db:migrate
RAILS_ENV=test rails db:exists && rails db:migrate || rails db:create db:migrate
rake
