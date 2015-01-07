# Mixed pages for users that are not logged in (including welcome page, contact, help etc.)

class PagesController < ApplicationController
  def index
    if user_signed_in?
      @notebooks = current_user.notebooks

      if @notebooks.size == 0
        notebook = Notebook.new(name: "First Notebook", user: current_user)
        notebook.save
        @notebooks.reload
      end

      redirect_to notebook_path(@notebooks.first)
      #render "index_logged_in", layout: "logged_in"

    end
  end
end