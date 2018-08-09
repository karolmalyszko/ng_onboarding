# README

Crude and dirty, but fullfills all the requirements ;)

Included are ::
* sidekiq with dashboard, available at /sidekiq
* crono, also with dashboard, although not working as expected, at /crono
* redis for key-value store

Crono fires up a sidekiq worker every 10 seconds and puts some gibberish to stdout.
Number of fired tasks can be tracked from sidekiq dashboard.

Usage ::
* clone the repo
* docker-compose up
* done :)


* Ruby version :: ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-linux]
* Rails version :: 5.2.0
