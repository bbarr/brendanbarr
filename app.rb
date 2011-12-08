require "sinatra/base"
require "bundler"
Bundler.require

module BB
  class App < ::Sinatra::Base
    
    #config
    set :static, true
    set :public_folder, File.join(File.dirname(__FILE__), './public/')
    
    before do
      expires 2592000, :public
    end
    
    #routes
    get "/" do
      array = [:blah, :index]
      haml array[rand(array.size)]
    end
    
  end
end