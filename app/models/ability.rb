# app/models/ability.rb
class Ability
  include CanCan::Ability
 
  def initialize(user)
    # Define abilities for the passed in user here.
    user ||= User.new # guest user (not logged in)
    # a signed-in user can do everything
    if user.is? :admin
     # an admin can do everything
      can :manage, :all
    elsif user.is? :provider
      #can :manage, :all
      # an editor can do everything to documents and reports
      #can :manage, [Document, Report]
      # but can only read, create and update charts (ie they cannot
      # be destroyed or have any other actions from the charts_controller.rb
      # executed)
      #can [:read, :create, :update], Chart
      # an editor can only view the annual report
      #can :read, AnnualReport
    elsif user.is? :member
      can :manage, :all
      #can :read, [Users]
    else
      #can :manage, :all
    end
  end
end