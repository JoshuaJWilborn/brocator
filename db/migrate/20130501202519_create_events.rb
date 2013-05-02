class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.float :latitude
			t.float :longitude
			t.integer :user_id
			t.string :title
			t.string :body
			t.integer :entry_fee
			t.boolean :official
      t.timestamps
			t.string :address

    end
  end
end
