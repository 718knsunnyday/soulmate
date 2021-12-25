# frozen_string_literal: true

class Farmer::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_farmer, only: [:create]

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
    farmer_customer_path(current_farmer)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def reject_farmer
    @customer = Farmer.find_by(email: params[:farmer][:email])
    if @customer
      if @customer.valid_password?(params[:farmer][:password]) && !@customer.is_valid
        flash[:notice] = "退会済みです。新しく登録してからご利用ください。"
        redirect_to new_farmer_registration_path
      end
    end
  end
end
