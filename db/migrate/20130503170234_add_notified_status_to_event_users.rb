class AddNotifiedStatusToEventUsers < ActiveRecord::Migration
  def change
    add_column :event_users, :notified, :boolean, :default => false
	end
end
