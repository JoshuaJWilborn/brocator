class SeparateFirstFromLastNameUser < ActiveRecord::Migration
  def change
		add_column :profiles, :fname, :string
		add_column :profiles, :lname, :string
	end
end
