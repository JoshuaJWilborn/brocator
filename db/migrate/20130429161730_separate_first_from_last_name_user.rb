class SeparateFirstFromLastNameUser < ActiveRecord::Migration
  def change
		remove_column :users, :name
		add_column :profiles, :fname, :string
		add_column :profiles, :lname, :string
	end
end
