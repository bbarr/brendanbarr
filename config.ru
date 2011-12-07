require "./lib/boot.rb"

use Rack::Session::Cookie
use Rack::Flash

map "/" do
	run BB::Default
end