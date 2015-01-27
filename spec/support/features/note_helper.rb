module Features
  module NoteHelpers
    def create_note(note)
      visit '/'
      fill_in 'note_text', with: note.text
      click_button('Save new note')
    end
  end
end