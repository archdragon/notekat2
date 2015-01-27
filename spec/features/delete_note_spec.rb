require 'rails_helper'

feature 'delete note' do
  before do
    create_user_and_sign_in
  end

  scenario 'with any text' do
    note = build(:note)
    create_note(note)

    first('.btn-destroy').click

    expect(find('#main').find('.inner')).to_not have_content(note.text)

  end
end