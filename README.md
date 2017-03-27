# README

This README would normally document whatever steps are necessary to get the
application up and running.

Start pg: `$pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start`

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

  Environment variables you neet to set:

  Email:
    ENV['BG_EMAIL_DOMAIN']='gmail.com'
    ENV['BG_EMAIL_USER']='username'
    ENV['BG_EMAIL_PASS']='password'

  Allowed origin:
    ENV['BG_ALOWED_ORIGIN']='http://localhost:3001'

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
=======
# backgammon-api
this is the end point for backgammon game
