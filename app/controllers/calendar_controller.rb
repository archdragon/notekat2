class CalendarController < ApplicationController
  layout "logged_in"
  def index
    @versions = Version.where(whodunnit: current_user)
  end
end