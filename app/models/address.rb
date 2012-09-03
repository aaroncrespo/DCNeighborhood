class Address
	include Mongoid::Document
	include Mongoid::Timestamps
	include Gmaps4rails::ActsAsGmappable
	
	acts_as_gmappable 	:position => :location

	field :location, 	:type => Array

	field :gmaps, 		:type => Boolean

	field :street,    	:type => String
	field :city,      	:type => String
	field :zipcode,   	:type => Integer
	field :country,   	:type => String
  	#either use geo tagging or a feild for neighborhood
	def gmaps4rails_address
		"#{self.street}, #{self.city}, #{self.country}" 
	end
end

