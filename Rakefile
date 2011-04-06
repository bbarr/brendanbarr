require "rake"
require "./lib/boot.rb"

task :seed do
  User.create :username => 'bbarr', :password => Digest::SHA1.hexdigest('Password')
end