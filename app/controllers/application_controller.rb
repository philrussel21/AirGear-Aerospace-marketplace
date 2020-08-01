class ApplicationController < ActionController::Base
  # from pagy gem; sets up the module that contains all the helpers
  include Pagy::Backend 
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_nav_categories

  protected
  # accepts company name during registration and put in the account table
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:company_name])
  end

  def set_nav_categories
    @nav_categories = Category.all
  end
end
