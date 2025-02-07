# README

Users postgresql in development and production ensure 

Setup
  * $ git clone git@github.com:maxcobmara/infinitask.git
  * $ bundle install
  * update config/database.yml with your local credentials
  * $ rails db:setup
  * $ ./bin/dev to start with foreman



Original Build Tasks
  * asdf plugin update ruby
  * asdf install ruby 3.4.1gem install rails -v8.0.1
  * asdf global ruby 3.4.1
  * rails new infinitask --css=bootstrap -j=esbuild
  * cd infinitask
  * git initialize and push
  * rails generate scaffold task title:string description:text completed:boolean
