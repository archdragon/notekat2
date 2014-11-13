# Mixed pages for users that are not logged in (including welcome page, contact, help etc.)

class PagesController < ApplicationController
  def index
    if user_signed_in?

    end
  end
end