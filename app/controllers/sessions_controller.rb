class SessionsController < ApplicationController
    def new
    end

    def create
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