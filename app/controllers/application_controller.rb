class ApplicationController < ActionController::Base
    before_action :require_login

    private
    def require_login
        redirect_to login_path unless session[:username]
    end

    def already_logged_in        
        redirect_to root_path if session[:username]
    end
end
