class Destination < ActiveRecord::Base
  attr_accessible :address, :route_id, :time, :_destroy, :latitude, :longitude
  attr_accessor :_destroy

  # Retrieve Coordinates from geocode.
  geocoded_by :address
  after_validation :geocode # turn it into latlong after validation.

  validates :address, :presence => true 

end
