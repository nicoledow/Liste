class TasksController < ApplicationController
  before_action :require_login 
  
  def index
    if params[:list_id]
      @tasks = List.find(params[:list_id]).tasks.incomplete
      @list = List.find(params[:list_id])
    else
      @tasks = Task.incomplete
    end
    @task = Task.new
    @lists = List.all
    @assignment = Assignment.new
    @users = User.all
  end

  def show
    @task = Task.find_by_id(params[:id])
    @users = User.all
    if @task.assigned?
      assignment = Assignment.find_by(task_id: @task.id)
      @person = assignment.user
    end
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

  def completed
    @tasks = Task.find_by(list_id: params[:list_id]).completed
  end


  private
  def task_params
    params.require(:task).permit(:description, :list_id)
  end
end