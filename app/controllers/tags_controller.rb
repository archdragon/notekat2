class TagsController < ApplicationController
  layout "logged_in"

  def index
    @notebooks = current_user.notebooks
    @tags = Note.tag_counts_on(:tags)
  end
end