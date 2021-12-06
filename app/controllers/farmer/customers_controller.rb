class Farmer::CustomersController < ApplicationController

  def show
    @customer = current_farmer
  end

  def edit
    @customer = current_farmer
  end

  def update
    @customer = current_farmer
    @customer.update(farmer_params)
    redirect_to farmer_customer_path(@customer)
  end

  def unsubscribe
    @customer = current_farmer
  end

  def withdraw
    @customer = current_farmer
    @customer.update(is_valid: true)
    reset_session
    redirect_to farmer_customers_thanks_path
  end

  def thanks
  end

  private

  def farmer_params
    params.require(:farmer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email)
  end

end