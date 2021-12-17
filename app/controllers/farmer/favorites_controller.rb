class Farmer::FavoritesController < ApplicationController
  def create
    @farm = Farm.find(params[:farm_id])
    favorite = @farm.favorites.new(public_id: current_public.id)
    favorite.save
  end

  def destroy
    @farm = Farm.find(params[:farm_id])
    favorite = @farm.favorites.find_by(public_id: current_public.id)
    favorite.destroy
  end
end
