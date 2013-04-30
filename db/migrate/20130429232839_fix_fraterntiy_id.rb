class FixFraterntiyId < ActiveRecord::Migration
  def change
		remove_column :profiles, :fraternity_id
		add_column :users, :fraternity_id, :integer
  end
end
