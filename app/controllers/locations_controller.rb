class LocationsController < ApplicationController

    layout "users"

    def show
        @location = Location.find(params[:id])
    end

    def index
        @users = User.all
        if params[:user].blank?
            @locations = Location.all
        else
            @locations = Event.where(user_id: params[:user]).locations
        end
    end

    def new
        @location = Location.new
    end

    def create
        @location = Location.new(location_params)
        @location.users << User.find(session[:user_id])
        @location.events = []
        # location.user = User.find(session[:user_id])
        if @location.valid?
            @location.save
            redirect_to '/locations'
        else
            render :new
        end
    end

    def edit
        @location = Location.find(params[:id])
    end

    def update
        @location = Location.find(params[:id])
        @location.update(location_params)
        if @location.valid?
            redirect_to '/home'
        else
            render :edit
        end
    end

    private

    def location_params
        params.require(:location).permit(:name, :info, :address)
    end

end