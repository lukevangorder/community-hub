class SessionsController < ApplicationController

    def foyer
    end

    def new #user login
    end

    def create
        @user = User.find_by(username: params[:login][:identification])
        if @user == nil
            @user = User.find_by(email: params[:login][:identification])
        end
        if @user.authenticate(params[:password])
            sessions[:user_id] = @user.id
            redirect_to '/home'
        end # Add error handling here
    end

    def signup #user sign up
    end

    def register
        @user = User.new(username: params[:login][:username], email: params[:login][:email], password: params[:login][:password], name: params[:login][:name])
        if @user.save
            sessions[:user_id] = @user.id
            redirect_to '/home'
        end # Add error handling here
    end

end