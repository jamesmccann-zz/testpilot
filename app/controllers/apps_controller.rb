class AppsController < ApiController

  def index
    @apps = current_user.apps
  end

  def show
    @app = current_user.apps.find(params[:id])
  end

  private

    def app_params
      params[:app].permit(:name)
    end

end
