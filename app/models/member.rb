class Member < ActiveRecord::Base

  attr_accessible :dob, :first_name, :gender, :last_name

  has_one :user, as: :profile, :dependent => :destroy# polymorphic to User Model (delete this will remove user informations)

  validates :first_name, :last_name, :presence => true 

  accepts_nested_attributes_for :user


end
