module Firmapi
  class Company
  	attr_reader :name

  	def initialize(name)
  		@name = name
  	end

  	def self.find_by_siren(siren)
  		self.new("EVANGELINA")
  	end
  end
end