module Firmapi
  class Location
  	include Virtus.model

  	attribute :latitude, Float
  	attribute :longitude, Float

  	def ==(other_location)
  		self.latitude == other_location.latitude && self.longitude == other_location.longitude
  	end

  end
end