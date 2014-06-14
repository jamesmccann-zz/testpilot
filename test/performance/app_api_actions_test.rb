require 'test_helper'
require 'rails/performance_test_help'

class AppAPIActionsTest < ActionDispatch::PerformanceTest
  # Refer to the documentation for all available options
  # self.profile_options = { runs: 5, metrics: [:wall_time, :memory],
  #                          output: 'tmp/performance', formats: [:flat] }

  setup do
    post '/users/sign_in', email: user.email, password: user.password
    create_list(:app, 10)
  end

  test "app index page" do
    get '/api/apps.json'
  end

  test "app creation" do
    post '/api/apps', app: attributes_for(:app)
  end
end
