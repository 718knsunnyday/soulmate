class Farmer::FavoritesController < ApplicationController
  before_action :authenticate_public!

  def create
    @farm = Farm.find(params[:farm_id])
   
    favorite = @farm.favorites.new(public_id: current_public)
    
    favorite.save
  end

  def destroy
    @farm = Farm.find(params[:farm_id])
    favorite = @farm.favorites.find_by(public_id: current_public)
    favorite.destroy
  end
end
