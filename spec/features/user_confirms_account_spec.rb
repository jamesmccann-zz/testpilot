require 'spec_helper'

feature 'User confirms account' do
  let(:user) { create(:user, :unconfirmed) }

  scenario 'valid token' do
    token = generate_confirmation_token_for(user)
    expect {
      visit user_confirmation_path(confirmation_token: token)
      user.reload
    }.to change(user, :confirmed?).to be_true
    expect(current_path).to eq new_user_session_path
  end

  scenario 'invalid token' do
    expect {
      visit user_confirmation_path(confirmation_token: 'test')
      user.reload
    }.to_not change(user, :confirmed?).to be_true
  end

  private

    # Private: Generate a valid confirmation token for a valid user.
    #
    # Devise stores confirmation and password reset tokens in encrypted digest
    # form within the database. This prevents an attack vector where a database
    # copy can be used to reset user's passwords with known tokens.
    #
    # This method provides a way of knowing what the confirmation token is in raw
    # form, in order to pass it to the confirmation form for testing.
    #
    # user - The user to generate the confirmation token for - assumes that the user
    #        already has a confirmation token generated.
    #
    # Returns raw confirmation token
    def generate_confirmation_token_for(user)
      old_token = user.confirmation_token
      new_token = Devise.token_generator.digest(User, :confirmation_token, old_token)
      user.update_attribute(:confirmation_token, new_token)

      return old_token
    end
end