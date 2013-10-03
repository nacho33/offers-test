class LandingController < ApplicationController

	def index
		if user_signed_in?
			redirect_to offers_path
		else
			puts User.all.to_yaml
			puts Venue.all.to_yaml
			respond_to do |format|
				format.html 
			end
		end
	end

end
