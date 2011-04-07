require "sinatra/base"
require "bundler"
Bundler.require

# require helpers
require File.join(File.dirname(__FILE__), "./helpers.rb")

# require base app first
require File.join(File.dirname(__FILE__), "./apps/base.rb")

# now require all the other apps
Dir.glob(File.join(File.dirname(__FILE__), "./apps/*.rb")) { |file| require file }

# now require all the other models
Dir.glob(File.join(File.dirname(__FILE__), "./models/*.rb")) { |file| require file }

# setup mote with mongoDB connection
if env['MONGOHQ_URL']
  uri = URI.parse(ENV['MONGOHQ_URL'])
  conn = Mongo::Connection.from_uri(ENV['MONGOHQ_URL'])
  Mote.db = conn.db(uri.path.gsub(/^\//, ''), :pk => Mote::PkFactory)
else
  Mote.db = Mongo::Connection.new.db("brendanbarr", :pk => Mote::PkFactory)
end
