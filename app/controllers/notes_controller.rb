class NotesController < ApplicationController
  before_filter :select_notebook, :except => [:show_by_tag, :index]
  layout "logged_in", :only => [:show_by_tag, :show, :version]

  def index
    @notes = @notebook.notes
  end

  def update
    @note = current_user.notes.find(params[:id])
    @note.text = params[:note][:text]
    @note.tags.delete_all
    if @note.save
      current_user.tag(@note, with: NotekatTags::Extractor.extract_tags(@note.text), on: :tags)
      redirect_to notebook_path(@notebook)
    else
      redirect_to notebook_path(@notebook), alert: "There was a problem saving your note!"
    end
  end

  def create
    @note = Note.new(notebook: @notebook, text: params[:note][:text])
    if @note.save
      current_user.tag(@note, with: NotekatTags::Extractor.extract_tags(@note.text), on: :tags)
      redirect_to notebook_path(@notebook)
    else
      redirect_to root_path
    end
  end

  def destroy
    @note = current_user.notes.find(params[:id])
    @note.tags.delete_all
    @note.destroy
    redirect_to notebook_path(@notebook)
  end

  def show_by_tag
    @notes = Note.tagged_with(params[:tag])
    render :index
  end

  def show
    @note = current_user.notes.find(params[:id])    
  end

  def version
    @note = current_user.notes.find(params[:id])
    @note = @note.versions.find(params[:version_id]).reify
    render :show
  end

  private

  def select_notebook
    @notebook = current_user.notebooks.find(params[:notebook_id]) if params[:notebook_id]
  end

end