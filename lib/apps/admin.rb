module BB
  class Admin < Base
    
    before do
      require_user
    end
    
    get "/" do
      'admin index'
    end
    
  end
end