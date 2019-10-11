class NotesController < ApplicationController
  before_action :require_login 

  def create
    binding.pry
    note = Note.new(note_params)
    task = Task.find_by_id(note_params[:task_id])
    if note.save 
      flash[:success] = "Note added"
      redirect_to list_path(task.list)
    else
      flash[:failure] = "An error occurred. Please try again."
      redirect_to list_path(task.list)
    end
  end




  private
  def note_params
    params.permit(:task_id, :content)
  end
end