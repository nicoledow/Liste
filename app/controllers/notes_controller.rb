class NotesController < ApplicationController
  def create
    binding.pry

  end




  private
  def note_params
    params.require(:note).permit(:task_id, :content)
  end
end