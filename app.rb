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
      cache_control :public, :max_age => 43200 # set to same as default heroku asset cache
      etag 1
      haml :index
    end
    
  end
end