class Farmer::FarmsController < ApplicationController


  def new
    @farm = Farm.new
  end

  def create
    farm = Farm.new(farm_params)
    farm.save
    redirect_to farmer_farm_path(farm)
  end

  def show
    @farm = Farm.find(params[:id])
  end

  def index
    @farms = Farm.all
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

  private
    def farm_params
      params.require(:farm).permit(:name, :manager, :post_code, :prefecture, :city, :house_number, :breed, :purchasing_method, :contact, :description, :image, variety: [])
    end

end
