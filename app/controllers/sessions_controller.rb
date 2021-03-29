class SessionsController < ApplicationController

    def new #user login
    end

    def create
        session[:username] = params[:username]
        redirect_to '/home'
    end

    def signup #user sign up
    end

    def register
    end

end