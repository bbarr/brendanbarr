require "./app.rb"
require "./blog/app.rb"
require "rack-subdomain"

if ENV['RACK_ENV'] == 'development'
  use Rack::CommonLogger
  use Rack::ShowExceptions
  domain = 'brendanbarr.dev'
else
  domain = 'brendanbarr.com'
end

use Rack::Subdomain, domain, to: "/:subdomain"

map "/" do
	run BB::App
end

map "/blog" do
  use Rack::Static, :urls => ['/css', '/js', '/images', '/favicon.ico'], :root => 'blog/public'
  run BB::Blog
end
