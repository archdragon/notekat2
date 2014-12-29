class NotesController < ApplicationController
  before_filter :select_notebook

  def index
    @notes = @notebook.notes
  end

  def update
    @note = @notebook.notes.find(params[:id])
    @note.text = params[:note][:text]
    @note.save
    
    redirect_to notebook_path(@notebook)
  end

  def create
    @note = Note.new(notebook: @notebook)
    if @note.save
      redirect_to notebook_path(@notebook)
    else
      redirect_to root_path
    end
  end

  private 

  def select_notebook
    @notebook = current_user.notebooks.find(params[:notebook_id])
  end

end