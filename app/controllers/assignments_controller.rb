class AssignmentsController < ApplicationController
  before_action :require_login 
  
  def index
    @assignments = Assignment.all
  end

  def show
    @assignment = Assignment.find_by_id(params[:id])
  end

  def new
    @assignment = Assignment.new
  end

  def create
    raise params.inspect
  end

end