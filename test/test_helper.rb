ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
  ActiveRecord::Migration.check_pending!

  def teardown
    User.delete_all
  end

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  def user
    @@user ||= FactoryGirl.create(:user)
  end
  # Add more helper methods to be used by all tests here...
end