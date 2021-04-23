class SessionsController < ApplicationController

    def foyer
    end

    def new #user login
        @user = User.new
    end

    def create
        @user = User.find_by(username: params[:login][:identification])
        if @user == nil
            @user = User.find_by(email: params[:login][:identification])
        end
        if @user.authenticate(params[:login][:password])
            session[:user_id] = @user.id
            redirect_to '/home'
        else 
            @user.errors[:base] << "Username or password incorrect"
            render :new
        end
    end

    def signup #user sign up
        @user = User.new
    end

    def register
        @user = User.new(username: params[:login][:username], email: params[:login][:email], password: params[:login][:password], name: params[:login][:name])
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to '/home'
        else
            render :signup
        end 
    end

    def logout
        session.delete :user_id
        redirect_to '/'
    end

    def facebook
        @user = User.find_by(email: auth['info']['email'])
        if @user
            session[:user_id] = @user.id
            redirect_to '/home'
        else
            @user = User.new
            @user.email = auth['info']['email']
            @user.password = 'facebook'
            @user.name = auth['info']['name']
            @user.username = auth['info']['email'].split('@').first
            i = 0
            unless @user.valid?
                i += 1
                @user.username = auth['info']['email'].split('@').first.concat(i.to_s)
            end
            @user.save
            session[:user_id] = @user.id
            redirect_to '/home'
        end
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end