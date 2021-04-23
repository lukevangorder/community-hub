class UsersController < ApplicationController

    def home
        @user = User.find(session[:user_id])
    end
    
    def show
        @user = User.find(params[:id])
        @events = User.find(params[:id]).events
        @locations = User.find(params[:id]).locations
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        if params[:id].to_i == session[:user_id]
            user = User.find(params[:id].to_i)
            user.bio = params[:user][:bio]
            user.save
            redirect_to '/home'
        else
            redirect_to '/home'
        end
    end

end