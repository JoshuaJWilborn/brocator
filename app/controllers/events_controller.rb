class EventsController < ApplicationController
  def index
		@location = request.location.data
		if @location['ip'] = "127.0.0.1"
			@location['latitude'] = 37.78757258738848
			@location['longitude'] = -122.39080927096823
		end
		@events = Event.near([@location['latitude'], @location['longitude']], 25).
			includes(:fraternity)
		@events.map!{|event| event.as_json(include: :fraternity)}
	end


	def search
		if address = params[:address]
			@location = {}
			search = Geocoder.search("160 folsom st").first.data['geometry']['location']
			@location['latitude'], @location['longitude'] = search['lat'], search['lng']
			if distance = params[:distance]
        @events = Event.near(address, distance.to_i)
			  @events.map!{|event| event.as_json(include: :fraternity)}
				render :index
			else
        @events = Event.near(address, 150)
				@events.map!{|event| event.as_json(include: :fraternity)}
				render :index
			end
		else
			render :nothing => true
		end
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(params[:event])
		@event.user_id = current_user.id
		if @event.save
			redirect_to events_path(@event)
		else
			render :new
		end
	end

	def update
    @event = Event.find(params[:id])
		if @event.user_id == current_user.id
			@event.update_attributes(params[:event])
			@event.save
			redirect_to event_path(@event)
		else
      redirect_to events_path
		end
	end

	def edit
		@event = Event.find(params[:id])
		if current_user.id == @event.user.id
			render :edit
		else
			render :show
		end
	end

	def show
		@event = Event.find(params[:id])
	end

	def destroy
    @event = Event.find(params[:id])
		if current_user == @event.user
			@event.destroy
		end
		redirect_to events_path
	end

	def attend
	  @event = Event.find(params[:id])
	  if @event.attending_users.include?(current_user)
			event_user = Event.find_where(:user_id = current_user.id, :event_id => @event.id)
		  event_user.destroy
		else
			event_user = EventUser.new(:user_id = current_user.id, :event_id => @event.id)
			event_user.save
		end
		render :nothing => true
	end
end
