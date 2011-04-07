module BB
  module Helpers
    
    # Render content that was stored in the content array with the given key
    def content(key)
      @content && @content[key]
    end

    # Define content for a particular key to render later at the appropriate
    # point, Simulates Rails's content_for helper
    def content_for(key, &block)
      @content ||= {}
      @content[key] = capture_haml(&block)
    end
  end
end

module Mote
  class Document
    
    class << self

      def find_by_id id
        self.find_one( { '_id' => id } )
      end
      
    end
    
    
    def get_id subject
      return subject if subject.is_a? BSON::ObjectId
      return subject['_id'] unless subject['_id'].nil?
    end
    
  end
end