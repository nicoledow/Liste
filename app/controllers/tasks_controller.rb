class TasksController < ApplicationController
  before_action :find_task
  skip_before_action :find_task, only: [:index, :new, :create]
  
  def index
    if params[:list_id]
      @tasks = List.find(params[:list_id]).tasks.incomplete
      @list = List.find(params[:list_id])
    else
      @tasks = Task.incomplete
    end
    @completed_list_tasks = List.find(params[:list_id]).tasks.completed
    @task = Task.new
    @lists = List.all
    @assignment = Assignment.new
    @users = User.all
    @current_user = current_user
  end

  def show
    @task = Task.find_by_id(params[:id])
    @new_task = Task.new
    @users = User.all
    @assignment = Assignment.new
    @assignees = @task.users
    @new_note = Note.new
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
    @list = List.find_by_id(task_params[:list_id])
    if @task.save
      redirect_to list_tasks_path(@list)
    else
      flash[:error] = "An error occurred. Please try again."
      redirect_to list_tasks_path(@list)
    end
  end

  def completed
    @tasks = Task.find_by(list_id: params[:list_id]).completed
  end

  def edit 
    @lists = List.all
  end

  def update
    @task = Task.find_by_id(params[:id])
    @task.update(task_params)
    if @task.save
      flash[:updated] = "Task updated."
      redirect_to list_tasks_path(@task.list)
    else
      flash[:error] = "An error occurred. Please try again."
      redirect_to task_path(@task)
    end
  end

  def destroy
    @task = Task.find_by_id(params[:id])
    list = @task.list
    @task.destroy
    redirect_to list_tasks_path(list)
  end

  def mark_complete
    task = Task.find_by_id(params[:id])
    task.completed = true
    task.completed_at = Time.now
    task.save
    flash[:completed] = "Task complete!"
    redirect_to list_tasks_path(task.list)
  end

  def mine
    @current_user = current_user
    @my_tasks = Assignment.all.select {|a| a.user_id == @current_user.id}
  end


  private
  def task_params
    params.require(:task).permit(:description, :list_id)
  end
end