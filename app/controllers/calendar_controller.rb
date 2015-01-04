class CalendarController < ApplicationController
  layout "logged_in"
  def index
    @versions = Version.all
  end
end