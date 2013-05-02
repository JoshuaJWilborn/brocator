class UsersController < ApplicationController
	before_filter :authenticate_user!

	def index

		@location = request.location.data
		if @location['ip'] = "127.0.0.1"
			@location['latitude'] = 37.78757258738848
			@location['longitude'] = -122.39080927096823
		end
		@profiles = Profile.near([@location['latitude'], @location['longitude']], 25).
		  includes(:fraternity)
		@profiles.map!{|profile| profile.as_json(include: :fraternity)}
	end
end
