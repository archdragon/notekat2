class NotesController < ApplicationController
  before_filter :select_notebook, :except => [:show_by_tag]
  layout "logged_in", :only => [:show_by_tag]

  def index
    @notes = @notebook.notes
  end

  def update
    @note = @notebook.notes.find(params[:id])
    @note.text = params[:note][:text]
    @note.tags.delete_all
    current_user.tag(@note, with: NotekatTags::Extractor.extract_tags(@note.text), on: :tags)
    if @note.save
      redirect_to notebook_path(@notebook)
    else
      redirect_to notebook_path(@notebook), alert: "There was a problem saving your note!"
    end
    
    
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