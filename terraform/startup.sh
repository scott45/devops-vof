#!/bin/bash
set -e
set -o pipefail

start_postgres() {
  service postgresql start
}

set_up_db_user() {
  sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'postgres';"
}

set_up_db() {
  su - vof -c 'cd /home/vof/app && rake db:setup && rake db:seed'
}

create_log_files() {
  mkdir -p /var/log/vof
  touch /var/log/vof/vof.out.log /var/log/vof/vof.err.log
  sudo chown -R vof:vof /var/log/vof/vof.out.log /var/log/vof/vof.err.log
}

start_app() {
  su - vof -c 'cd /home/vof/app && bundle exec puma -C config/puma.rb 1> /var/log/vof/vof.out.log 2> /var/log/vof/vof.err.log &'
}

main() {
  start_postgres
  set_up_db_user
  set_up_db
  create_log_files
  start_app
}

main "$@"