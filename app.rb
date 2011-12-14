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
      puts request.subdomain.nil?
      unless request.subdomain.nil?
        haml request.subdomain.to_sym
      end
      haml :index
    end
  end
end

# We re-open the request class to add the subdomains method
module Rack
  class Request
    def subdomain
      domains = host.split('.')
      domains.size > 2 ? domains.first : nil
    end
  end
end