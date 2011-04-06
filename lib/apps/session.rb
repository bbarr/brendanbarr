module BB
  class Session < Base
    
    get "/new" do
      haml :"session/new"
    end
    
    post "/new" do
      env['warden'].authenticate! :password
      redirect "/admin"
    end
    
  end
end