class RegistrationsController < Devise::RegistrationsController
  protected

  # redirects user to creating profile page after sign up
  def after_sign_up_path_for(resource)
    new_profile_path
  end
end