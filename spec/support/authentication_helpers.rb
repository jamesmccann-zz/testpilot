
def sign_up_with(email, password)
  visit new_user_session_path
  fill_in 'Email address', with: email
  fill_in 'Password', with: password
  click_button 'Sign in'
end
