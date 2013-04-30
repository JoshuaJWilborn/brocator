class Profile < ActiveRecord::Base
  attr_accessible :about, :birthday, :fname, :lname, :user_id, :lat, :long, :address
	validates :about,  :birthday, :fname, :lname, :user_id, :lat, :long, :presence => true

  belongs_to :user


	def age
		(Date.today - birthday).to_i / 365.floor
	end
end
