class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Thank you! You have successfully signed up!"
      redirect_to lists_path
    else 
      render :new
    end
  end




  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :manager)
  end
end