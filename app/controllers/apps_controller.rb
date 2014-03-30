class AppsController < ApiController

  def index
    @apps = App.all
  end

  def show
    @app = App.find(params[:id])
  end

  def create
    @app = App.new(app_params)
    if @app.save
      @app.create_activity :create
      render status: 201
    else
      render json: { errors: @app.errors }, status: 406
    end
  end

  private

    def app_params
      params[:app].permit(:name)
    end

end
