class FixProfileLatLonType < ActiveRecord::Migration
  def change
		drop_column :profiles, :latitude
		add_column :profiles, :latitude, :float
    drop_column :profiles, :longitude
		add_column :profiles, :longitude, :float

	end
end
