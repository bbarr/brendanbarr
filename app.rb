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
      response.headers['Cache-Control'] = 'public, max-age=300'
      haml :index
    end
    
  end
end