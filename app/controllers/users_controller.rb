class UsersController < ApplicationController

    def home
        @user = User.find(session[:user_id])
    end
    
    def show
        @user = User.find(params[:id])
    end
end