class ListsController < ApplicationController
  before_action :require_login 
  
  def new
    @list = List.new
  end
  
  def index
    @lists = List.incomplete.order("created_at DESC").all
    @completed_lists = List.completed.order("created_at DESC").all
    @new_list = List.new
    @current_user = current_user
  end


  def show
    @list = List.find_by_id(params[:id])
    @task = Task.new
    @current_user = current_user
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
    @list = List.find_by_id(params[:id])
    @list.update(list_params)
    redirect_to list_path(@list)
  end

  def mark_complete
    list = List.find_by_id(params[:id])
    list.completed = true
    list.completed_at = Time.now
    list.save
    redirect_to lists_path
  end

  def destroy
    list = List.find_by_id(params[:id])
    list.destroy
    redirect_to lists_path
  end


  private
  def list_params
    params.require(:list).permit(:title)
  end
end