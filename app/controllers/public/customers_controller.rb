class Public::CustomersController < ApplicationController
  def show
    @customer = current_public
  end

  def edit
     @customer = current_public
  end

  def update
    customer = current_public
    customer.update(public_params)
    redirect_to customer_path(customer)
  end

  def unsubscribe
    @customer = current_public
  end

  def withdraw
    @customer = current_public
    @customer.update(is_valid: false)
    reset_session
    redirect_to public_thanks_path
  end

  def thanks
  end


  private
    def public_params
      params.require(:public).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email)
    end
end
