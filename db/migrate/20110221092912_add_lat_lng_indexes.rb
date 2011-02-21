class AddLatLngIndexes < ActiveRecord::Migration
  def self.up
  	add_index(:vehicles, :latitude)
  	add_index(:vehicles, :longitude)
  end

  def self.down
  	remove_index(:vehicles, :latitude)
  	remove_index(:vehicles, :longitude)
  end
end
