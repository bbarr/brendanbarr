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
    date_to_use = is_new? ? self['created_at'] : self['updated_at']
    self['formatted_date'] = Date.parse(date_to_use.to_s).to_s
  end
  
end