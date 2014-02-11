class AccountController < ApplicationController
	def index
          email = params[:email]
          salt  = "12345678"
          key   = ActiveSupport::KeyGenerator.new('mypassword').generate_key(salt) 
          crypt = ActiveSupport::MessageEncryptor.new(key)        
          pass = crypt.decrypt_and_verify(params[:secret_pass]) 
          Garb::Session.login(email, pass)
          @accounts = Garb::Management::Account.all
	end
end
