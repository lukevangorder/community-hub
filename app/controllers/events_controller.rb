class EventsController < ApplicationController

    layout "users"

    def index
        @events = Event.all
    end

    def new
        @event = Event.new
    end

    def create
        event = Event.new(name: params[:event][:name], info: params[:event][:info], starts_at: params[:event][:starts_at], ends_at: params[:event][:ends_at])
        if event.save
            User.find(sessions[:user_id]).events < event
            redirect_to '/events'
        end #add error handling
    end

end