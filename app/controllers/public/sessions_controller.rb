# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_public, only: [:create]
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def after_sign_in_path_for(resource)
    customer_path(current_public)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def reject_public
    @customer = Public.find_by(email: params[:public][:email])
    if @customer
      if @customer.valid_password?(params[:public][:password]) && !@customer.is_valid
        
        redirect_to new_public_registration_path
      end
    end
  end
end
