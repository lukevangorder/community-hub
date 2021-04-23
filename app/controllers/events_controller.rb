class EventsController < ApplicationController

    layout "users"

    def index
        @users = User.all
        @locations = Location.all
        if params[:user_id]
            @events = Event.where(user_id: params[:user_id].to_s)
        elsif params[:location_id]
            @events = Event.where(location_id: params[:location_id].to_s)
        else
            @events = Event.all
        end
    end

    def show
        @event = Event.find(params[:id])
    end

    def new
        @event = Event.new
        @locations = Location.all
        @location = Location.new
    end

    def create
        @event = Event.new(event_params)
        @location = @event.location
        @event.user = User.find(session[:user_id])
        if params[:event][:location_id].present?
            @event.location = Location.find(params[:event][:location_id])
        end
        if @event.valid? && @event.location.valid?
            @event.location.save
            @event.save
            redirect_to '/events'
        else
            @locations = Location.all
            render :new
        end
    end

    def edit
        @event = Event.find(params[:id])
        @location = @event.location
        @locations = Location.all
    end

    def update
        @event = Event.find(params[:id])
        @event.update(event_params)
        if @event.valid? && @event.location.valid? && @event.user.id == session[:user_id]
            redirect_to '/home'
        else
            @locations = Location.all
            render :edit
        end
    end

    private

    def event_params
        params.require(:event).permit(:name, :info, :starts_at, :location, :ends_at, :user, location_ids:[], location_attributes: [:name, :address, :info])
    end

end