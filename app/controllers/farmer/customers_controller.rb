class Farmer::CustomersController < ApplicationController
  def show
    @customer = current_farmer
  end

  def index
    @farms = Farm.where(farmer_id: current_farmer.id)
  end

  def edit
    @customer = current_farmer
  end

  def update
    @customer = current_farmer
    if @customer.update(farmer_params)
      redirect_to farmer_customer_path(@customer), notice: "マイページを更新しました。"
    else
      flash.now[:alert] = "更新に失敗しました。"
      render :edit
    end
  end

  def unsubscribe
    @customer = current_farmer
  end

  def withdraw
    @customer = current_farmer
    @customer.update(is_valid: false)
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
