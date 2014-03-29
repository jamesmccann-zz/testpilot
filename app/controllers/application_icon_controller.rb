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

      if attachment.present?
        send_file attachment.path,
                  filename: attachment.file.filename,
                  type:     attachment.file.content_type
      else # Redirect to fallback URL
        redirect_to attachment.url
      end
    end

    def find_app
      @app ||= App.find(params[:app_id])
    end


end
