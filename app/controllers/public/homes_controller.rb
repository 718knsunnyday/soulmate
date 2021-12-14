class Public::HomesController < ApplicationController

  def top
  end

  def about
  end

  def search
    @farms = Farm.search(params[:search])
  end

end
