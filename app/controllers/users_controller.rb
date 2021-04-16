class UsersController < ApplicationController
    skip_before_action :require_login, only: [:new, :create, :update]
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
            flash.now[:error] = @user.errors[:username][0]
            render :new
        end
    end

    def update
        @current_user = User.find(params[:id])
        @current_user.update(balance: @current_user.balance + 10)                
        redirect_to root_path
    end
end
