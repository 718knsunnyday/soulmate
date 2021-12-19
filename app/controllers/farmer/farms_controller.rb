class Farmer::FarmsController < ApplicationController
  def new
    @farm = Farm.new
  end

  def create
    @farm = Farm.new(farm_params)
    @farm.farmer_id = current_farmer.id
    @farm.save
    redirect_to farmer_farm_path(@farm)
  end

  def show
    @farm = Farm.find(params[:id])
    @post_comment = PostComment.new
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
    @farms = Farm.joins(:cultivated_items).where(cultivated_items: {name: params[:variety]})

  end

  private

  def farm_params
    params.require(:farm).permit(:name, :manager, :post_code, :prefecture, :city, :house_number, :breed,
                                 :purchasing_method, :contact, :description, :image, cultivated_item_ids:[])
  end
end
