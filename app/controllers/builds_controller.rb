class BuildsController < ApplicationController
  include JSONDefault

  before_action :assign_app_from_token!, only: :create
  # skip_before_action :authenticate_user!, only: :create

  before_action :assign_app, only: [:index, :show]
  before_action :assign_build, only: [:show]

  def index
    @builds = @app.builds
    render
  end

  def show
    send_file @build.apk.file.path
  end

  def create
    @build = @app.builds.build(build_params)
    @build.save ? render(status: 201) : render(json: {errors: @build.errors}, status: 406)
  end


  private

    def build_params
      params[:build].permit(:release_notes, :apk)
    end

    def assign_app
      @app = App.find(params[:app_id])
    end

    def assign_build
      @build = @app.builds.find(params[:id])
    end

    # Private: Require a valid build token to proceed.
    # This implementation is more or less copied from
    # Devise's authentication token implementation,
    # aside from a custom failure case.
    def assign_app_from_token!
      build_token = params[:build_token].presence
      success = build_token && @app = App.find_by_build_token(build_token.to_s)

      if !success
        raise ActionController::Forbidden
      end
    end



end
