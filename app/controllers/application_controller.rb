class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :load_notebooks

  protected

  def load_notebooks
    @notebooks = current_user.notebooks if current_user
  end
end
