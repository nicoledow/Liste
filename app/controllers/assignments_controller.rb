class AssignmentsController < ApplicationController
  before_action :require_login 
  
  def index
    if params[:user_id]
      @user_restricted = true
      @user = User.find_by_id(params[:user_id])
      @assignments = Assignment.all.select {|a| a.user_id == @user.id}
    else
      @user_restricted = false
      @assignments = Assignment.all
    end
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
    end
  end


  private
  def assignment_params
    assignment_params = params.require(:assignment).permit(:user_id, :due_date, :task_id)
  end
end