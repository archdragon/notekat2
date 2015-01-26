module Features
  module SessionHelpers
    def sign_up_with(email, password)
      visit new_user_registration_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password
      click_button 'Sign up'
    end

    def sign_in_with(email, password)
      #visit new_user_session_path
      visit new_user_session_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_button 'Log in'
    end

    def create_user_and_sign_in
      user = create(:user)
      sign_up_with(user.email, user.password)
      sign_in_with(user.email, user.password)
    end
  end
end