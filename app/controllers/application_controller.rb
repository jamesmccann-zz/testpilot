class ApplicationController < ActionController::Base
  include PublicActivity::StoreController

  # Prevent CSRF attacks by nullifying the session.
  # For applications, you may want to use :exception instead.
  protect_from_forgery with: :null_session
  before_filter :authenticate_user!, unless: :devise_controller?
  before_filter :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource

  private

    def layout_by_resource
      devise_controller? ? "authentication" : "application"
    end

    def after_sign_out_path_for(resource)
      new_user_session_path
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:accept_invitation) do |u|
        u.permit(:full_name, :password, :password_confirmation, :invitation_token)
      end
    end

end
