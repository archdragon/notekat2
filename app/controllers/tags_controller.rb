class TagsController < ApplicationController
  layout "logged_in"

  def index
    @tags = Note.tag_counts_on(:tags)
  end
end