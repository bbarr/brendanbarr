require "rake"
require "./lib/boot.rb"

task :seed do
  Mote.db['users'].insert({ :username => 'bbarr', :password => Digest::SHA1.hexdigest('Password') })
end