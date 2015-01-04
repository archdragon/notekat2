class Version < ActiveRecord::Base
  extend SimpleCalendar
  has_calendar

  def starts_at
    self.created_at
  end
end