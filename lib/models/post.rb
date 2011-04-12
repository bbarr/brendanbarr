class Post < Mote::Document
  include Mote::Keys
  include Mote::Timestamps
  include Mote::Callbacks
  
  key :title
  key :uri_title
  key :category, :default => 'general'
  key :content
  key :formatted_date
  
  before_save :format_date
  
  def instantiate_document hash
    hash['uri_title'] = hash['title'].gsub(/\s/, '-').downcase
    super
  end
  
  def format_date 
    self['formatted_date'] = Date.parse(self['updated_at'].to_s).to_s
  end
  
end