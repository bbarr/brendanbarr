require "sinatra/base"
require "bundler"
Bundler.require

# require helpers
require File.join(File.dirname(__FILE__), "./helpers.rb")

# require base app first
require File.join(File.dirname(__FILE__), "./apps/base.rb")

# now require all the other apps
Dir.glob(File.join(File.dirname(__FILE__), "./apps/*.rb")) { |file| require file }