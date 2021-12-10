class Farm < ApplicationRecord
  attachment :image
  has_many :favorites, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  def favorited_by?(farm)
    favorites.where(farm_id: farm.id).exists?
  end
  
  def bookmarked_by?(farm)
    bookmarks.where(farm_id: farm.id).exists?
  end

  def full_address
    '〒' + post_code + ' ' + prefecture + ' ' + city + ' ' + house_number
  end
end