require 'digest/sha1'

class User < Mote::Document
  include Mote::Keys
  
  key :username
  key :password
  
  class << self
    def authenticate username, password
      User.find_one({ :username => username, :password => Digest::SHA1.hexdigest(password) })
    end
  end
  
end