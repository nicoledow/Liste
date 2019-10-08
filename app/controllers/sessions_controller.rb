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

    def facebook_create
      @user = User.find_or_create_by(id: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
      end
      session[:user_id] = @user.id

      redirect_to lists_path
    end


    private
    def auth
      request.env['omniauth.auth']
    end
  end