require "./lib/boot.rb"

use Rack::PageSpeed, :public => "public" do
  store :disk => "public"
  inline_css
  combine_javascripts
end

map "/" do
	run BB::Default
end