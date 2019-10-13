class AssignmentsController < ApplicationController
  before_action :require_login 
  
  def index
      @user = User.find_by_id(params[:user_id])
      @assignments = Assignment.all.select {|a| a.user_id == @user.id}
  end

  def show
    @assignment = Assignment.find_by_id(params[:id])
  end

  def new
    @assignment = Assignment.new
  end

  def create
    assignment = Assignment.new(assignment_params)
    if assignment.save
      redirect_to list_tasks_path(assignment.task.list)
    else
      flash[:error] = "An error occurred. Please try again."
      redirect_to list_tasks_path(assignment.task.list)
    end
  end


  private
  def assignment_params
    assignment_params = params.require(:assignment).permit(:user_id, :due_date, :task_id)
  end
end