class Public::HomesController < ApplicationController
  def top
    @farms = Farm.order(created_at: :desc).limit(4)
  end

  def about
  end

  def search
    @farms = Farm.search(params[:search])
  end
end
