class Provider < ActiveRecord::Base

  attr_accessible :name, :registered_number 

  has_one :user, as: :profile, :dependent => :destroy# polymorphic to User Model (delete this will remove user informations)

  validates :name, :registered_number, :presence => true 

  accepts_nested_attributes_for :user


end
