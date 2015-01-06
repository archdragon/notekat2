class TagsController < ApplicationController
  layout "logged_in"

  def index
    @tags = current_user.notes.tag_counts_on(:tags)
    @tags.sort_by { |tag| tag.name }
  end
end