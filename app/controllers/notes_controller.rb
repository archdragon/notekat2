class NotesController < ApplicationController
  def index
    @notebook = current_user.notebooks.find(params[:notebook_id])
    @notes = @notebook.notes

    respond_to do |format|
      format.json { render :json => @notes }
    end
  end
end