class Farmer::FarmsController < ApplicationController
  # before_action :variety_string, only: [:create, :update]

  def new
    @farm = Farm.new
  end

  def create
    @farm = Farm.new(farm_params)
  　@farm.save
    redirect_to farmer_farm_path(@farm)
  end

  def show
    @farm = Farm.find(params[:id])
  end

  def index
    @farms = Farm.all.order(params[:sort]).page(params[:page]).per(5)
  end

  def ranking
    @favorite_ranks = Farm.find(Favorite.group(:farm_id).order('count(farm_id) desc').limit(10).pluck(:farm_id))
  end

  def edit
    @farm = Farm.find(params[:id])
  end

  def update
    @farm = Farm.find(params[:id])
    @farm.update(farm_params)
    redirect_to farmer_farm_path(@farm.id)
  end

  def destroy
    farm = Farm.find(params[:id])
    farm.destroy
    redirect_to new_farmer_farm_path
  end

  def prefecture
  end

  def result_prefecture
    @farms = Farm.where(prefecture: params[:prefecture])
  end

  def variety
  end

  def result_variety
    @farms = Farm.where(variety: params[:variety])
  end

  # def variety_string
  # params[:farm][:variety] = params[:farm][:variety].join(",")
  # end

  private

  def farm_params
    params.require(:farm).permit(:name, :manager, :post_code, :prefecture, :city, :house_number, :breed, :purchasing_method, :contact, :description, :image_, variety: [])
  end
end
