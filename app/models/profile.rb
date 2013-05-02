class Profile < ActiveRecord::Base
  attr_accessible :about, :birthday, :fname, :lname, :user_id, :latitude, :longitude, :address

	validates :about,  :birthday, :fname, :lname, :user_id, :presence => true

  has_one :fraternity, :through => :user

	belongs_to :user

	geocoded_by :coordinates

	def age
		(Date.today - birthday).to_i / 365.floor
	end


end
