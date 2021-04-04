class EventsController < ApplicationController

    layout "users"

    def index
        @events = Event.all
    end

    def new
        @event = Event.new
        @locations = Location.all
    end

    def create
        event = Event.new(event_params)
        event.user = User.find(session[:user_id])
        event.location = Location.find(params[:event][:location][1])
        if event.save
            redirect_to '/events'
        end
    end

    private

    def event_params
        params.require(:event).permit(:name, :info, :starts_at, :ends_at, :user, :location_id)
    end

end