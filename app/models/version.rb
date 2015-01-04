class Version < ActiveRecord::Base
  extend SimpleCalendar
  has_calendar

  # Needed for placing the object in SimpleCalendar
  def starts_at
    self.created_at
  end
end