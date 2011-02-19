class Vehicle < ActiveRecord::Base
	acts_as_mappable :default_units => :kms,
									 :default_formula => :sphere,
									 :lat_column_name => :latitude,
									 :lng_column_name => :longitude
end
