module BB
  class Base < ::Sinatra::Base
    
    helpers ::BB::Helpers
   
    def require_user
      redirect "/session/new" unless env['warden'].authenticated?(:password)
    end
  end
end