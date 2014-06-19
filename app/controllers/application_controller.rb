class ApplicationController < ActionController::Base
  include PublicActivity::StoreController

  # Prevent CSRF attacks by nullifying the session.
  # For applications, you may want to use :exception instead.
  protect_from_forgery with: :null_session
  before_filter :authenticate_user!, unless: :devise_controller?
  before_filter :configure_permitted_parameters, if: :devise_controller?

  private

    def after_sign_out_path_for(resource)
      new_user_session_path
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:accept_invitation) << :full_name
      devise_parameter_sanitizer.for(:account_update) << :full_name
    end

end
