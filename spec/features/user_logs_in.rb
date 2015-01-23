require 'rails_helper'

feature 'User logs in' do
  scenario 'with valid login and password' do
    user = create(:user)
    sign_in_with(user.name, user.password)
    expect(page).to have_css("#logged-in")
  end

  def sign_in_with(login, password)
    #visit new_user_session_path
    visit "/"
    click_link "login-link"
    fill_in 'Login', with: login
    fill_in 'Password', with: password
    click_button 'Sign in'
  end
end