require 'rails_helper'

feature 'browse notebook' do
  scenario 'after login' do
    user = create(:user)
    sign_in_with(user.email, user.password)
    expect(page).to have_css(".notebook-link")
  end
end