require 'spec_helper'

feature "User logs in" do
  let(:user) { create(:user) }

  scenario 'with valid email and password' do
    sign_up_with user.email, user.password
    expect(page).to have_content('Signed in successfully')
  end

  scenario 'with invalid email' do
    sign_up_with 'fake@example.com', 'password'
    expect(page).to have_content('Sign in')
  end

  scenario 'with blank password' do
    sign_up_with user.email, ' '
    expect(page).to have_content('Invalid email or password')
  end

  scenario "already signed in" do
    sign_up_with(user.email, user.password)
    visit new_user_session_path
    expect(page).to have_content('You are already signed in')
  end



end
