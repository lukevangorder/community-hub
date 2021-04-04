class LocationsController < ApplicationController

    def show
    end

    def index
        @locations = Location.all
    end

    def new
    end

    def create
    end

end