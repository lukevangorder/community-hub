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
        binding.pry
        event = Event.new(event_params)
        event.user = User.find(session[:user_id])
        if event.save
            redirect_to '/events'
        end
    end

    private

    def event_params
        params.require(:event).permit(:name, :info, :starts_at, :ends_at, :user)
    end

end