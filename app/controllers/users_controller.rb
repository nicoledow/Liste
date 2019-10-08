class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    raise params.inspect
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Thank you! You have successfully signed up!"
      redirect_to lists_path
    end
  end




  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end