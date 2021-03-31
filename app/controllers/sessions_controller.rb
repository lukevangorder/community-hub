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
        if @user.authenticate(params[:login][:password])
            session[:user_id] = @user.id
            redirect_to '/home'
        else # Add error handling here
            redirect_to '/'
        end
    end

    def signup #user sign up
    end

    def register
        @user = User.new(username: params[:login][:username], email: params[:login][:email], password: params[:login][:password], name: params[:login][:name])
        if @user.save
            session[:user_id] = @user.id
            redirect_to '/home'
        end # Add error handling here
    end

    def logout
        session.delete :user_id
        redirect_to '/'
    end

    def facebook
        binding.pry
        @user = User.find_or_create_by(email: auth['info']['email'])
        if @user
            @user.name = auth['info']['name']
            @user.save
            redirect_to '/home'
        else
            redirect_to '/'
        end
    end

end