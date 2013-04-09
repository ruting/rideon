class ApplicationController < ActionController::Base
  protect_from_forgery   
          
	def home
	 
	end
  
	#Redirect user back to current page after oauth sigin
	def after_sign_in_path_for(resource)
	request.env['omniauth.origin'] || stored_location_for(resource) || root_path
	end

	def after_sign_out_path_for(resource_or_scope)
	  request.referrer
	end

	
end