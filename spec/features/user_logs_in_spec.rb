require 'rails_helper'

feature 'User logs in' do
  scenario 'with valid login and password' do
    user = create(:user)
    sign_in_with(user.email, user.password)
    expect(page).to have_css("#logged-in")
  end
end