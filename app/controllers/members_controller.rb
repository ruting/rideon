class MembersController < ApplicationController

def index
	#Redirect user to login page if sessions not found.
    @members = Member.all # Use @ for views to be able to see it
    if !current_user
 	  redirect_to new_member_url
	  end
end


def new
  @user = User.new
  @member = Member.new
  # respond_to do |format|
  # format.html  new.html.erb
  # format.json { render json: @user }
  # end

end

 def create
    @user = User.new(params[:user])
    @member = Member.new(params[:member])
    @user.profile = @member

    respond_to do |format|
      if @user.save
        format.html { sign_in_and_redirect @user, notice: 'User was successfully created.' }
        format.json { render json: @member, status: :created, location: @member }
      else
        format.html { render action: "new" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @Member = Member.find_by_id(params[:id])
    @Member.destroy 

    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :no_content }
    end
  end

end
