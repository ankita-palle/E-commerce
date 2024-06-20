# frozen_string_literal: true

# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |user_params| user_params.permit(:email, :password, :phone_number, :first_name, :last_name, :address) }
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:password, :password_confirmation, :email, :current_password, :phone_number, :first_name, :last_name, :address)
    end
  end
  
  rescue_from CanCan::AccessDenied do |_exception|
    flash[:error] = 'Access denied.'
    redirect_to root_url
  end
end
