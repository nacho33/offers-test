class ApplicationController < ActionController::Base
  protect_from_forgery

	rescue_from CanCan::AccessDenied do |exception|
		redirect_to root_url, :alert => exception.message
	end

	def user_owns_venue?(venue)
	    return (current_user.role.eql?('admin') or (current_user.role.eql?('venue') and 
	    	venue.users.pluck('users.id').include?(current_user.id)))
  	end

  	def only_admin
	    if !current_user or current_user.role != 'admin'
	      respond_to do |format|
	        format.html {redirect_to :status => 422}
	        format.xml{  render :xml => 'Access Denied',  :status => 403 }
	        format.json{ render :json => 'Access Denied', :status => 403 }
	      end
	    end
  	end
end
