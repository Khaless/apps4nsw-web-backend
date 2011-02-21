class Vehicle < ActiveRecord::Base

	def self.dataset_name; "Realtime Bus Locations"; end

	acts_as_mappable :default_units => :kms,
									 :default_formula => :sphere,
									 :lat_column_name => :latitude,
									 :lng_column_name => :longitude
end
