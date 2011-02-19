class CreateVehicles < ActiveRecord::Migration
  def self.up
    create_table :vehicles do |t|
			t.float :latitude
			t.float :longitude
			t.string :service_description
			t.string :organisation
			t.string :trip_status
			t.integer :route_direction
			t.integer :route_variant
			t.integer :route_name
      t.timestamps
    end
  end

  def self.down
    drop_table :vehicles
  end
end
