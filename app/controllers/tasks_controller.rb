class TasksController < ApplicationController
  def index
    if params[:list_id]
      @tasks = List.find(params[:list_id]).tasks
    else
      @tasks = Task.all
    end
  end


  
end