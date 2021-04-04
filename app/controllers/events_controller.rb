class EventsController < ApplicationController

    layout "users"

    def index
        @events = Event.all
    end

    def new
        @event = Event.new
        @locations = Location.all
        @location = Location.new
    end

    def create
        binding.pry
        event = Event.new(event_params)
        event.user = User.find(session[:user_id])
        if params[:event][:location][1]
            event.location = Location.find(params[:event][:location][1])
        else
            event.location = Location.find_or_create_by(params[:event][:locations_attributes])
        end
        binding.pry
        if event.save
            redirect_to '/events'
        end
    end

    private

    def event_params
        params.require(:event).permit(:name, :info, :starts_at, :ends_at, :user, location_ids:[], locations_attributes: [:name, :address, :info])
    end

end