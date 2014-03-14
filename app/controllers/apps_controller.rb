class AppsController < ApiController

  def index
    @apps = App.all
  end

  def show
    @app = App.find(params[:id])
  end

  private

    def app_params
      params[:app].permit(:name)
    end

end
