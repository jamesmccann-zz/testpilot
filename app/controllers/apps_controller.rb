class AppsController < ApplicationController

  def index
    @apps = App.all
  end

  def new
    @app = App.new
  end

  def create
    @app = App.new(app_params)
    if @app.save
      redirect_to @app
    else
      render action: 'new'
    end
  end

  def show
    @app = App.find(params[:id])
  end

  def edit
    @app = App.find(params[:id])
  end

  def update
    @app = App.find(params[:id])
    if @app.update_attributes(app_params)
      redirect_to @app
    else
      render action: 'edit'
    end
  end

  def builds
    @app = App.find(params[:id])
  end

  private

  def app_params
    params[:app].permit!
  end

end
