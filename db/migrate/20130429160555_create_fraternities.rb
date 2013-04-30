class CreateFraternities < ActiveRecord::Migration
  def change
    create_table :fraternities do |t|
      t.string :name
			t.string :greek_name
      t.timestamps
    end
  end
end
