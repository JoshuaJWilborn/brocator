class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
			t.date :birthday
      t.text :about
			t.integer :user_id
			t.integer :fraternity_id
      t.timestamps
    end
  end
end
