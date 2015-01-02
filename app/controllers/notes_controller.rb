class NotesController < ApplicationController
  before_filter :select_notebook, :except => [:show_by_tag]
  layout "logged_in", :only => [:show_by_tag]

  def index
    @notes = @notebook.notes
  end

  def update
    @note = @notebook.notes.find(params[:id])
    @note.text = params[:note][:text]
    @note.tag_list.add(NotekatTags::Extractor.extract_tags(@note.text))
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

  def show_by_tag
    @notes = Note.tagged_with(params[:tag])
    render :index
  end

  private

  def select_notebook
    @notebook = current_user.notebooks.find(params[:notebook_id]) if params[:notebook_id]
  end

end