require 'rails_helper'

feature 'create notebook' do
  before do
    create_user_and_sign_in
  end
  scenario 'with valid name', :js => true do
    notebook = build(:notebook)
    visit '/'
    click_button('new-notebook')

    sleep 2

    fill_in 'notebook_name', with: notebook.name

    click_button('Create notebook')

    expect(find('#left-menu').find('#notebook-list')).to have_content(notebook.name)
  end
end