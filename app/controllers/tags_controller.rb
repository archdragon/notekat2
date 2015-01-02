class TagsController < ApplicationController
  layout "logged_in"

  def index
    @tags = Note.tag_counts_on(:tags)
  end

  def show
    @notes = Note.tagged_with(params[:id])
  end
end