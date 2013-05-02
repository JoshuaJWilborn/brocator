class Event < ActiveRecord::Base
  attr_accessible :title, :body, :latitude, :longitude, :address, :user_id, :date
	attr_accessible :official, :entry_fee

	validates :address, :title, :body, :entry_fee, presence: true

  after_validation :geocode

  belongs_to :user

  has_many :event_users
  has_many :attending_users, :through => :event_attendies, :source => :user
	has_one :fraternity, :through => :user

	geocoded_by :address

end
