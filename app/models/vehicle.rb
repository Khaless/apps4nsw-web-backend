class Vehicle < ActiveRecord::Base
	acts_as_mappable :default_units => :kms,
									 :default_formula => :sphere
end
