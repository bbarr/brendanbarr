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
      haml :index
      # puts request.subdomain.nil?
      # if request.subdomain.nil?
      #   
      # end
      # haml request.subdomain.to_sym
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