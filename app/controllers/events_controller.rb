class EventsController < ApplicationController

    layout "users"

    def index
        @events = Event.all
    end

    def new
        @event = Event.new
    end

    def create
        binding.pry
    end

end