class Farmer::CustomersController < ApplicationController

  def show
    @customer = current_farmer
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
