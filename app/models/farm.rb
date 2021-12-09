class Farm < ApplicationRecord
  attachment :image
  has_many :favorites, dependent: :destroy


  # def favorited_by?(public)
    # favorites.where(public_id: current_public.id).exists?
  # end

  def full_address
    '〒' + post_code + ' ' + prefecture + ' ' + city + ' ' + house_number
  end
end