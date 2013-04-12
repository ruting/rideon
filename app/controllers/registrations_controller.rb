class RegistrationsController < Devise::RegistrationsController
  
  def create
    super
    session[:omniauth] = nil unless @user.new_record?
  end
  
  def build_resource(*args)
      super
      if session[:omniauth]
        @user.apply_omniauth(session[:omniauth])
        # Create a New Member association (first_name, last_name, dob)
        @member = Member.new()

        @user.avatar = open(session[:omniauth].info.image) #Add Twitter image
        @member.first_name = session[:omniauth].info.name.split(" ")[1] #Add Twitter name
        @member.last_name = session[:omniauth].info.name.split(" ")[0] #Add Twitter name
        @user.profile = @member
        @user.roles= ['member'] #Set user as a member by default logging in using Twitter Account
        @user.valid? # validate user
      end
  end


  #after sucessful user registration, reroute user to the below page (normal registration and twitter)
  #def after_sign_up_path_for(resource)
  #  '/user'
  #end


  #def new_user_registration_path_for(resource)
  #  '/register'
  #end

    
end