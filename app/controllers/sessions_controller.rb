class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]
    before_action :already_logged_in, only: [:new, :create]
    
    def new
    end

    def create
        @user = User.find_by_username(params[:username])

        if @user
            session[:username] = @user.username
            redirect_to root_path
        else
            if params[:username] == ""
                flash.now[:error] = "You must enter a username"
            else
                flash.now[:error] = "User doesn't exist"
            end
            render :new
        end
    end

    def destroy
        session[:username] = nil
        redirect_to login_path
    end
end
