class FixProfileLatLonType < ActiveRecord::Migration
  def change
		remove_column :profiles, :latitude
		add_column :profiles, :latitude, :float
    remove_column :profiles, :longitude
		add_column :profiles, :longitude, :float
	end
end
