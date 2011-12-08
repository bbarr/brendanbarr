# All apps inheret from this class
# Holds common config

module BB
  class Base < ::Sinatra::Base
    
    set :static, true
    set :method_override, true
    set :public, File.join(File.dirname(__FILE__), '../../public/')
    
    helpers ::BB::Helpers
      
  end
end