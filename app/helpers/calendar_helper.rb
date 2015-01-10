module CalendarHelper
  def archived_note_link(version_data)
    note = YAML::load(version_data.object)
    version_note_path(note.fetch("id"), version_data)
  end

  def current_note_link(version_data)
    note = YAML::load(version_data.object)
    note_path(note.fetch("id"))
  end
end