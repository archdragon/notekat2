# Mixed pages for users that are not logged in (including welcome page, contact, help etc.)

class PagesController < ApplicationController
  def index
    if user_signed_in?
      @notebooks = current_user.notebooks
      render layout: "logged_in"
    end
  end
end