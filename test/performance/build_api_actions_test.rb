require 'test_helper'
require 'rails/performance_test_help'

class BuildApiActionsTest < ActionDispatch::PerformanceTest
  # Refer to the documentation for all available options
  # self.profile_options = { runs: 5, metrics: [:wall_time, :memory],
  #                          output: 'tmp/performance', formats: [:flat] }

  def app_object
    @app_object ||= create(:app, assignments: [create(:assignment, user: user)])
  end

  def builds
    @builds ||= create_list(:build, 10, app: app_object)
  end

  setup do
    post '/users/sign_in', 'user[email]' => user.email, 'user[password]' => user.password
  end

  test "list of builds" do
    get "/api/apps/#{app_object.id}/builds"
  end

  test "view build" do
    get "/api/apps/#{app_object.id}/builds/#{builds.first.id}"
  end

  test "create build" do
    post "/api/apps/#{app_object.id}/builds", build: attributes_for(:build), build_token: app_object.build_token
  end

end
