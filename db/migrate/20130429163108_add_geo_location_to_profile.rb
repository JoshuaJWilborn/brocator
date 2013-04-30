class AddGeoLocationToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :geo_loc, :string
	end
end
