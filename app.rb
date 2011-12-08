require "sinatra/base"
require "bundler"
Bundler.require

module BB
  class App < ::Sinatra::Base
    
    #config
    set :static, true
    set :public_folder, File.join(File.dirname(__FILE__), './public/')
    
    #routes
    get "/" do
      cache_control :public, :max_age => 2592000 # set to same as default heroku asset cache
      last_modified Date.new
      array = [:blah, :index]
      haml array[rand(array.size)]
    end
    
  end
end