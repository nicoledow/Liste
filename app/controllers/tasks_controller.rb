class TasksController < ApplicationController
  
  def index
    if params[:list_id]
      @tasks = List.find(params[:list_id]).tasks
      @list = List.find(params[:list_id])
    else
      @tasks = Task.all
    end
  end

  def create
    raise params.inspect
  end


  
end