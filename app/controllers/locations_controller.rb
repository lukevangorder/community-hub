class LocationsController < ApplicationController

    layout "users"

    def show
    end

    def index
        @locations = Location.all
    end

    def new
        @location = Location.new
    end

    def create
        location = Location.new(location_params)
        # location.user = User.find(session[:user_id])
        if location.save
            redirect_to '/locations'
        end
    end

    private

    def location_params
        params.require(:location).permit(:name, :info, :address)
    end

end