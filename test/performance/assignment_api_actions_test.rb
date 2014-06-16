require 'test_helper'
require 'rails/performance_test_help'

class AssignmentApiActionsTest < ActionDispatch::PerformanceTest
  # Refer to the documentation for all available options
  # self.profile_options = { runs: 5, metrics: [:wall_time, :memory],
  #                          output: 'tmp/performance', formats: [:flat] }

  def app_object
    @@app_object ||= create(:app)
    @@assignment ||= create(:assignment, app: @@app_object, user: user)

    return @@app_object
  end

  setup do
    post '/users/sign_in', email: user.email, password: user.password
  end

  test 'assignments index' do
    create_list(:assignment, 10, app: app_object)
    get "/api/apps/#{app_object.id}/assignments"
  end

  test 'create assignment, existing user' do
    existing_user = create(:user)
    post "/api/apps/#{app_object.id}/assignments", assignment: {email: existing_user.email}
  end

  test 'create assignment, new user' do
    new_user = "new_user@example.org"
    post "/api/apps/#{app_object.id}/assignments", assignment: {email: new_user}
  end
end
