class Public::FavoritesController < ApplicationController

  def create
    farm = Farm.find(params[:farm_id])
    favorite = farm.favorites.new(farm_id: current_public.id)
    favorite.save
    redirect_to farmer_farm_path
  end

  def destroy
    farm = Farm.find(params[:farm_id])
    favorite = farm.favorites.find_by(farm_id: current_public.id)
    favorite.destroy
    redirect_to farmer_farm_path
  end
end
