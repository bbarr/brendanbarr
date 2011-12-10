require "sinatra/base"
require "bundler"
Bundler.require

module BB
  class App < ::Sinatra::Base
    
    #config
    set :static, true
    set :public_folder, File.join(File.dirname(__FILE__), './public/')
    
    #routes
    before do
      cache_control :public, :max_age => 60
    end
    
    get "/" do
      projects = File.read(File.join(File.dirname(__FILE__), './public/json/projects.json'))
      @projects = JSON.parse(projects)
      haml :index
    end
    
  end
end