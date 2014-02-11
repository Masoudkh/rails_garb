class ProfileController < ApplicationController
	def index
        	@profiles = Garb::Management::Profile.all
	end

end
