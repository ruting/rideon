class Destination < ActiveRecord::Base
  attr_accessible :coordinate, :route_id, :time, :_destroy
  attr_accessor :_destroy

  validates :coordinate, :presence => true 

end
