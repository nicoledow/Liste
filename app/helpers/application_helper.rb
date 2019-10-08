module ApplicationHelper
    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
        !!session[:user_id]
    end

    def require_login
      if !session[:user_id]
        flash[:login_required] = "Log in required."
        redirect_to root
      end
    end
end
