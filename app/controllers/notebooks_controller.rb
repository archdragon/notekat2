class NotebooksController < ApplicationController
  layout "logged_in", except: [:new, :create]  

  def index
  end

  def new
  end

  def update
    @notebook = current_user.notebooks.find(params[:id]).tap do |notebook|
      notebook.update!(notebook_params)
    end

    redirect_to notebook_path(@notebook)
  end

  def create
    @notebook = Notebook.new(notebook_params)
    @notebook.user_id = current_user.id
    if @notebook.save
      redirect_to notebook_path(@notebook)
    else
      redirect_to root_path
    end
  end

  def destroy
    @notebook = current_user.notebooks.find(params[:id]).tap do |notebook|
      notebook.notes.each do |note|
        note.tags.delete_all
        note.destroy
      end
      notebook.destroy
    end

    redirect_to root_path
  end

  def show
    @notebooks = current_user.notebooks
    @notebook = @notebooks.where(id: params[:id]).first
    @notes = @notebook.notes
  end

  private
    # Using a private method to encapsulate the permissible parameters is just a good pattern
    # since you'll be able to reuse the same permit list between create and update. Also, you
    # can specialize this method with per-user checking of permissible attributes.
    def notebook_params
      params.require(:notebook).permit(:name)
    end
end