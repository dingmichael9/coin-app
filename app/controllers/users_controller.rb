class UsersController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]
    before_action :already_logged_in, only: [:new, :create]
    
    def show
        @current_user = User.find_by_username(session[:username])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new({username: params[:username], balance: 10})

        if @user.save
            flash[:success] = "Welcome to Coin App!"
            session[:username] = @user.username
            redirect_to root_path
        else
            flash.now[:error] = "Invalid registration"
            render :new
        end
    end
end
