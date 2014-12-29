class NotebooksController < ApplicationController
  layout "logged_in", except: [:new, :create]  

  def index
  end

  def new
  end

  def create
    @notebook = Notebook.new(name: params[:name], user_id: current_user.id)
    if @notebook.save
      redirect_to notebook_path(@notebook)
    else
      redirect_to root_path
    end
  end

  def show
    @notebooks = current_user.notebooks
    @current_notebook = @notebooks.where(id: params[:id]).first
    @notes = @current_notebook.notes
  end
end