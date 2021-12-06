class Public::CustomersController < ApplicationController
  def show
  end

  def edit
  end

  def update
    @customer = current_public
    @customer.update(public_params)
    redirect customers_path
  end

  def destroy
  end

  private
    def public_params
      params.require(:public).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email)
    end
end
