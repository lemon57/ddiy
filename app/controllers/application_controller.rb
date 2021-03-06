class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected



  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || current_user.worker_profile.present? && dashboard_workers_path || dashboard_owners_path
  end



  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :first_name, :last_name, :phone_number, :photo, :location])

    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :first_name, :last_name, :phone_number, :photo, :location])
  end
end
