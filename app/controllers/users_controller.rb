class UsersController < ApplicationController

    def home
        @user = User.find(session[:user_id])
        @events = Event.all
    end
    
    def show
        @user = User.find(params[:id])
        @events = User.find(params[:id]).events
        @locations = User.find(params[:id]).locations
    end
end