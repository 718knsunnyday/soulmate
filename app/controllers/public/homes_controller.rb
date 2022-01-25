class Public::HomesController < ApplicationController
  def top
    @farms = Farm.order(created_at: :desc).limit(4)
  end

  def about
  end

  def search
    if params[:search].present?
      @farms = Farm.search(params[:search]).order(params[:sort]).page(params[:page]).per(5)
    else
      @farms = Farm.order(created_at: :desc).limit(4)
      redirect_to root_path
    end
  end
end
