class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    if params[:user][:user_type] == "pro"
      new_worker_profile_path # Or :prefix_to_your_route
    else
      create_new_owner_profile_path
    end
  end
end

