require "sinatra/base"
require "bundler"
Bundler.require

module BB
  class App < ::Sinatra::Base
    
    #config
    set :static, true
    set :public, File.join(File.dirname(__FILE__), './public/')
    
    #routes
    get "/" do
      haml :index
    end
    
  end
end