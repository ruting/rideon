class RatingCategory < ActiveRecord::Base
  attr_accessible :title
  has_attached_file : avatar, :style => { :small => "300x300>", :thumb => "100x100>"}, default_url => "/images/:style"
end
