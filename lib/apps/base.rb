# All apps inheret from this class
# Holds common config

module BB
  class Base < ::Sinatra::Base
    
    set :static, true
    set :method_override, true
    set :public, File.join(File.dirname(__FILE__), '../../public/')
    set :static_cache_control, [ :public, :max_age => 1000 ]
    
    helpers ::BB::Helpers
      
  end
end