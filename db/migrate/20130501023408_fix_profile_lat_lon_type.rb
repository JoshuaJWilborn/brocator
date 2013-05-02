class FixProfileLatLonType < ActiveRecord::Migration
  def change
		change_column :profiles, :latitude, :float
		change_column :profiles, :longitude, :float

	end
end
