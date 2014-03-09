class BuildsController < ApplicationController
  
  def new
    @app = App.find(params[:app_id])
    @build = Build.new
  end

  def create
    @app = App.find(params[:app_id])
    @build = Build.new(build_params.merge(app: @app))
    if @build.save
      redirect_to app_path(@app)
    else
      render action: 'new'
    end
  end

  private

  def build_params
    params[:build].permit!
  end

end
