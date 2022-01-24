class Public::HomesController < ApplicationController
  def top
    @farms = Farm.order(created_at: :desc).limit(4)
  end

  def about
  end

  def search
    @farms = Farm.search(params[:search]).order(params[:sort]).page(params[:page]).per(5)
  end
end
