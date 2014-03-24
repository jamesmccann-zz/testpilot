class ApplicationIconController < ApplicationController
  before_action :find_app

  def thumb
    respond_with_icon(:thumb) and return
  end

  def show
    respond_with_icon and return
  end

  private

    def respond_with_icon(version = nil)
      attachment = version ? @app.icon.send(version) : @app.icon
      send_file attachment.path,
                filename: attachment.file.filename,
                type:     attachment.file.content_type
    end

    def find_app
      @app ||= App.find(params[:id])
    end


end
