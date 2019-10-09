class SessionsController < ApplicationController

    def new
    end

    def create
      if auth
        user = User.create_with_omniauth(auth)
        session[:user_id] = user.id
        redirect_to lists_path
      else
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to lists_path
        else
          flash[:failure] = "Email or password was incorrect. Please try again."
          render :new
        end
      end
    end


    def destroy
      session.delete(:user_id)
      @current_user = nil
      redirect_to '/'
    end

  private
    def auth
      request.env['omniauth.auth']
    end
  end