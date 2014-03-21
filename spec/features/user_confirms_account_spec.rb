require 'spec_helper'

feature 'User confirms account' do
  let(:user) { create(:user, :unconfirmed) }

  scenario 'valid token' do
    token = generate_confirmation_token_for(user)
    visit user_confirmation_path(confirmation_token: token)
    expect(page).to have_content 'Your account was successfully confirmed.'
  end

  scenario 'invalid token' do
    visit user_confirmation_path(confirmation_token: 'test')
    expect(page).to have_content 'Confirmation token is invalid'
  end

  private

    def generate_confirmation_token_for(user)
      old_token = user.confirmation_token
      new_token = Devise.token_generator.digest(User, :confirmation_token, old_token)
      user.update_attribute(:confirmation_token, new_token)

      return old_token
    end
end