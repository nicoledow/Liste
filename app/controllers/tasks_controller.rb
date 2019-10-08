class TasksController < ApplicationController
  
  def index
    if params[:list_id]
      @tasks = List.find(params[:list_id]).tasks
      @list = List.find(params[:list_id])
    else
      @tasks = Task.all
    end
    @task = Task.new
    @lists = List.all
  end

  def new
    @task = Task.new
    @lists = List.all
  end

  def create
    @task = Task.new(task_params)
    @list = @task.list
    if @task.save
      redirect_to list_tasks_path(@list)
    else
      flash[:error] = "An error occurred. Please try again."
      redirect_to list_tasks_path
    end
  end


  private
  def task_params
    params.require(:task).permit(:description, :list_id)
  end
end