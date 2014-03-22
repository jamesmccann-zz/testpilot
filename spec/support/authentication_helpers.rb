
def sign_up_with(email, password)
  visit new_user_session_path
  fill_in 'Email address', with: email
  fill_in 'Password', with: password
  click_button 'Sign in'
end

def sign_in_user(user = FactoryGirl.create(:user))
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryGirl.create(:user)
    sign_in user
  end
end