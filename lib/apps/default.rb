# Handles requests for front-facing pages

module BB
  class Default < Base
   
    get "/" do
      haml :index
    end

  end
end