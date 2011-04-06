require "./lib/boot.rb"

use Warden::Manager do |manager|
  manager.default_strategies :password
  manager.failure_app = BB::SessionFailure
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