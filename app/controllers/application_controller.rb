class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by nullifying the session.
  # For applications, you may want to use :exception instead.
  protect_from_forgery with: :null_session
  before_filter :authenticate_user!, unless: :devise_controller?
  layout :layout_by_resource

  private

    def layout_by_resource
      devise_controller? ? "authentication" : "application"
    end

    def after_sign_out_path_for(resource)
      new_user_session_path
    end

end
