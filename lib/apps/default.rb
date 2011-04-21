# Handles requests for front-facing pages

module BB
  class Default < Base
   
    get "/" do
      @posts = Post.find.to_a
      @categories = @posts.map { |p| p.category }.uniq
      haml :"default/index"
    end
    
    get "/:category/?" do
      @posts = Post.find(:category => params[:category]).to_a       
      haml (@posts.size > 0 ? "default/index" : "default/404").to_sym  
    end
    
    get "/:category/:post/?" do
      @post = Post.find_one :uri_title => params[:post]
      haml (@post ? "default/post" : "default/404").to_sym
    end

  end
end