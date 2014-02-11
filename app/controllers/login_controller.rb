class LoginController < ApplicationController

	def index
  
	end
        
        def new
          
        end
         
        def create
           email = params[:login][:email]
           pass = params[:login][:password]
           salt  = "12345678"
           key   = ActiveSupport::KeyGenerator.new('mypassword').generate_key(salt) 
           crypt = ActiveSupport::MessageEncryptor.new(key) 
           secret_pass = crypt.encrypt_and_sign(pass)        

           redirect_to controller: :account, action: :index, :email => email, :secret_pass => secret_pass
        end
end
