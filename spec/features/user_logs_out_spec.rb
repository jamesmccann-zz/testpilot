require 'spec_helper'

feature 'User signs out' do
  let(:user) { create(:user) }

  before { sign_up_with user.email, user.password }

  scenario 'sign out' do
    click_link 'Sign out'
    expect(current_path).to eq new_user_session_path
    expect(page).to have_content 'Signed out successfully'
  end
end