class Farmer::FarmsController < ApplicationController
  def new
    @farm = Farm.new
  end

  def create
    @farm = Farm.new(farm_params)
    @farm.farmer_id = current_farmer.id
    if @farm.save
      redirect_to farmer_farm_path(@farm), notice: "登録できました。"
    else
      flash.now[:alert] = "登録できませんでした"
      render :new
    end
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
    if @farm.update(farm_params)
      redirect_to farmer_farm_path(@farm.id), notice: "更新しました。"
    else
      flash.now[:alert] = "更新できませんでした。"
      render :edit
    end
  end

  def destroy
    farm = Farm.find(params[:id])
    farm.destroy
    redirect_to farmer_farms_path
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

#ng
# "image"=>#<ActionDispatch::Http::UploadedFile:0x00007ff56528d950 @tempfile=#<Tempfile:/tmp/RackMultipart20211225-2594-83849t.jpg>,
# @original_filename="carrots-g3567d767e_640.jpg", @content_type="image/jpeg", @headers="Content-Disposition: form-data; name=\"farm[image]\";
# filename=\"carrots-g3567d767e_640.jpg\"\r\nContent-Type: image/jpeg\r\n">

# "image"=>"{\"size\":116025,\"content_type\":\"image/jpeg\",\"filename\":\"Chocolate-Dulce-de-Leche-Cake.jpeg\",
# \"id\":\"d857073d09a17442bf829f9f10ee2486e88b0d4a8c86309c2764fbf90b3e\"}"
