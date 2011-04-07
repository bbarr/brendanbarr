class Post < Mote::Document
  include Mote::Keys
  include Mote::Timestamps
  
  key :title
  key :uri_title
  key :content
  
  def instantiate_document hash
    hash['uri_title'] = hash['title'].gsub(/\s/, '-').downcase
    super
  end
  
end