class ProfileChangeGeoLoctoLatLon < ActiveRecord::Migration
  def change
		remove_column :profiles, :geo_loc
    add_column :profiles, :lat, :string
		add_column :profiles, :long, :string
	end
end
