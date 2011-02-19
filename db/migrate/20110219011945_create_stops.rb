class CreateStops < ActiveRecord::Migration
  def self.up
    create_table :stops do |t|
			t.float :latitude
			t.float :longitude
			t.string :tsndescription
      t.timestamps
    end
  end

  def self.down
    drop_table :stops
  end
end
