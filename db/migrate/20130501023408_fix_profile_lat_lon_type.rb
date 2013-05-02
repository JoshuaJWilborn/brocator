class FixProfileLatLonType < ActiveRecord::Migration
  def change
		change_column :profiles, :latitude, :double
		change_column :profiles, :longitude, :double

	end
end
