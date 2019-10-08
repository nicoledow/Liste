class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find_by_id(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user_id = session[:user_id]
    if @list.save
      redirect_to list_path(@list)
    else
      flash[:error] = "An error occurred. Please try again."
      render :new
    end
  end

  def edit
    @list = List.find_by_id(params[:id])
  end

  def update

  end


  private
  def list_params
    params.require(:list).permit(:title)
  end
end