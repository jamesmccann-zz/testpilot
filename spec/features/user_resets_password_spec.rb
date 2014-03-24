require 'spec_helper'

feature 'User requests password reset' do
  let(:user) { create(:user) }

  scenario 'requesting password' do
    visit new_user_password_path
    fill_in 'Email address', with: user.email
    click_button 'Send reset password instructions'
    expect(page).to have_content 'You will receive an email with instructions on how to reset your password in a few minutes.'
  end

  scenario 'changing password' do
    token = user.send_reset_password_instructions
    visit edit_user_password_path(reset_password_token: token)
    fill_in 'New password', with: 'newPassword'
    fill_in 'Confirm new password', with: 'newPassword'
    click_button 'Change my password'
    expect(page).to have_content 'Your password was changed successfully.'
  end

end