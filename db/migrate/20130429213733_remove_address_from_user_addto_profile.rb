class RemoveAddressFromUserAddtoProfile < ActiveRecord::Migration
  def change
		remove_column :users, :address
		add_column :profiles, :address, :string
	end
end
