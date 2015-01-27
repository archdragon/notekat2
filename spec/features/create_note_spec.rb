require 'rails_helper'

feature 'create note' do
  before do
    create_user_and_sign_in
  end

  scenario 'with any text' do
    note = build(:note)

    create_note(note)

    expect(find('#main').find('.inner')).to have_content(note.text)

    visit calendar_index_path

    # expect(find('#calendar').find('.today')).to have_css('.version-create')
  end

  scenario 'with tags' do
    note = build(:note_with_hashtags)

    visit '/'
    fill_in 'note_text', with: note.text
    click_button('Save new note')

    visit tags_path

    expect(find('#main').find('.inner')).to have_content('tag1')
  end
end