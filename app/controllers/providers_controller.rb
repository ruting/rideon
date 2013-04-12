class ProvidersController < ApplicationController

def index
	#Redirect user to login page if sessions not found.
    @members = Member.all # Use @ for views to be able to see it
    if !current_user
 	redirect_to new_provider_url
	end
end


def new
  @user = User.new
  @provider = Provider.new
  # respond_to do |format|
  # format.html  new.html.erb
  # format.json { render json: @user }
  # end

end

 def create
    @user = User.new(params[:user])
    @provider = Provider.new(params[:provider])
    @user.profile = @provider

    respond_to do |format|
      if @user.save
        format.html { sign_in_and_redirect @user, notice: 'User was successfully created.' }
        format.json { render json: @provider, status: :created, location: @provider }
      else
        format.html { render action: "new" }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit

  end

  # DELETE /providers/1
  # DELETE /providers/1.json
  def destroy
    @Provider = Provider.find_by_id(params[:id])
    @Provider.destroy 

    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :no_content }
    end
  end

end
