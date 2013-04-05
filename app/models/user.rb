class User < ActiveRecord::Base # The User class is automatically mapped to the table named "users"
  has_merit # Users' Badges
  attr_accessible :email, :first_name, :password, :last_name, :dob, :avatar
  has_attached_file :avatar, :styles => { :small => "100x100>", :thumb => "50x50>"}
  validates :email, :first_name, :password, :presence => true # All fields must not be empty
  validates :email, :uniqueness => true # Email must be unique
end
