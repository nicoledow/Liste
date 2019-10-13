class ApplicationController < ActionController::Base
    before_action :require_login
    skip_before_action :require_login, only: [:home]
    
    helper_method :current_user
    helper_method :logged_in?
    helper_method :require_login
    helper_method :find_task
    
    def home
    end


  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
     end

    def logged_in?
        !!session[:user_id]
    end

    def require_login
      if !session[:user_id]
        flash[:login_required] = "Log in required." 
        redirect_to root_path
      end
    end

    def find_task
      @task = Task.find_by_id(params[:id])
    end
end
