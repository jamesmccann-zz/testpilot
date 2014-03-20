class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by nullifying the session.
  # For applications, you may want to use :exception instead.
  protect_from_forgery with: :null_session
  before_action :authenticate!

  private

    def authenticate!
      authenticate_or_request_with_http_basic do |username, password|
        ENV.fetch('HTTP_BASIC_USERNAME', 'test') == username &&\
        ENV.fetch('HTTP_BASIC_PASSWORD', 'test123') == password
      end
    end
end
