#!/usr/bin/env bash

set -ex

install_dependencies() {
  sudo apt-get update

  sudo apt-get install -y --no-install-recommends git-core curl zlib1g-dev \
    build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev  \
    sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev wget nodejs      \
    python-software-properties libffi-dev postgresql postgresql-contrib    \
    libpq-dev
}

install_ruby() {
  sudo chgrp -R vof  /usr/local
  sudo chmod -R g+rw /usr/local

  curl -O -L https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.1.tar.gz
  tar zxf ruby-*

  pushd ruby-2.4.1
    ./configure
    make && make install
  popd
}

install_ruby_dependencies() {
  curl -O -L -k https://rubygems.org/rubygems/rubygems-2.6.12.tgz
  curl -O -L -k https://rubygems.org/downloads/bundler-1.15.3.gem

  tar zxf rubygems-2.6.12.tgz
  pushd rubygems-2.6.12
    ruby setup.rb
  popd

  gem install bundler-1.15.3.gem --local --no-ri --no-rdoc
}

main() {
  install_dependencies

  install_ruby

  install_ruby_dependencies
}

main "$@"