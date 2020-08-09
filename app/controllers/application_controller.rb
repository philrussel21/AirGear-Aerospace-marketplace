class ApplicationController < ActionController::Base
  # from pagy gem; sets up the module that contains all the helpers
  include Pagy::Backend 
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_nav_categories
  rescue_from ActiveRecord::RecordNotFound, with: :no_record_found

  protected
  # accepts company name during registration and put in the account table
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:company_name])
  end

  #queries all categories from categories table to be made available to navbar
  def set_nav_categories
    @nav_categories = Category.all
  end

  def no_record_found
    redirect_to listings_path, alert: "ERROR: No Record Found"    
  end
end
