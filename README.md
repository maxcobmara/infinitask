# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Original Build Tasks
asdf plugin update ruby
asdf install ruby 3.4.1gem install rails -v8.0.1
asdf global ruby 3.4.1
rails new infinitask
cd infinitask
rails generate scaffold task title:string description:text completed:boolean
