class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
	rescue_from CanCan::AccessDenied do |exception|
		redirect_to root_url, :alert => exception.message
	end

	def set_locale
	  available = ['es', 'en']
	  preferred = extract_locale_from_accept_language_header
	  if available.include? preferred
	    I18n.locale = preferred
	  else
	    I18n.locale = I18n.default_locale
	  end
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

  	private
	def extract_locale_from_accept_language_header
	  if request.env['HTTP_ACCEPT_LANGUAGE']
	    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
	  end
	end
end
