module BB
  class Default < Base
   
   get "/" do
     env.inspect
   end
    
  end
end