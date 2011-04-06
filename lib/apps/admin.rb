require 'digest/sha1'

module BB
  class Admin < Base
    
    use Rack::Auth::Basic, "Admin Area" do |username, password|
      u = Mote.db['users'].find_one
      u['username'] == username and u['password'] == Digest::SHA1.hexdigest(password)
  	end
    
    get "/" do
      haml :"admin/index"
    end
    
  end
end