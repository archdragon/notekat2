require 'rails_helper'

feature 'create notebook' do
  before do
    sign_in
  end
  scenario 'with valid name', :js => true do
    notebook = build(:notebook)
    visit '/'
    click_link('new-notebook')

    fill_in 'notebook_name', with: notebook.name

    expect(find('#left-menu').find('#notebook-list')).to have_content(notebook.name)
  end
end