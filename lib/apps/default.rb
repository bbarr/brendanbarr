module BB
  class Default < Base
   
   get "/" do
     @posts = Post.find
     haml :"default/index"
   end
    
  end
end