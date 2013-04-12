class Route < ActiveRecord::Base
  attr_accessible :allowed, :date, :max, :min, :price, :user_id, :time, :transport, :source, :source_attributes

  has_many :source,  :dependent => :destroy # (delete this will remove user informations)
  has_many :destination,  :dependent => :destroy # (delete this will remove user informations)

  accepts_nested_attributes_for :source, :allow_destroy => true
  accepts_nested_attributes_for :destination, :allow_destroy => true

  validates :transport, :price, :min, :max,  :presence => true 

end
