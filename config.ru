require "./lib/boot.rb"

use Rack::Session::Cookie
use Rack::Flash

use Warden::Manager do |manager|
  manager.default_strategies :password
  manager.failure_app = BB::SessionFailure
  manager.serialize_into_session { |user| user.id }  
  manager.serialize_from_session { |id| User.get(id) }
end

map "/" do
	run BB::Default
end

map "/admin" do
	run BB::Admin
end

map "/session" do
	run BB::Session
end