require 'rails_helper'

feature 'show notebooks' do
  before do
    create_user_and_sign_in
  end
  scenario 'after login' do
    expect(page).to have_css(".notebook-link")
  end
end