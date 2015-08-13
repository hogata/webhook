require 'bundler'
Bundler.require

#sinatraファイルの指定
require './app'

run Sinatra::Application
