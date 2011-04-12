require 'digest/sha1'

module BB
  class Admin < Base
    
    use Rack::Auth::Basic, "Admin Area" do |username, password|
      u = Mote.db['users'].find_one
      u['username'] == username and u['password'] == Digest::SHA1.hexdigest(password)
  	end
    
    get "/" do
      @posts = Post.all.to_a
      haml :"admin/index"
    end
    
    get "/add" do
      haml :"admin/add"
    end
    
    post "/add" do
      
      @post = Post.new params
      
      if @post.save
        redirect "/admin"
      else
        @errors = @post.errors
        haml :"admin/add"
      end
    end
    
    get "/:post/edit" do
      @post = Post.find_one :uri_title => params[:post]
      haml :"admin/edit"
    end
    
    put "/:post" do
      
      updated_post = Post.new params
      post = Post.find_one :uri_title => params[:post]
      
      ['title', 'uri_content', 'content', 'category'].each { |k| post[k] = updated_post[k] }       
      
      if post.save
        redirect "/admin"
      else
        @errors = post.errors
        haml :"admin/edit"
      end
    end
   
    delete "/:post" do
      @post = Post.find_one :uri_title => params[:post]      
      Post.remove @post['_id'] unless @post.nil?
      redirect "/admin"
    end
    
  end
end