class Farm < ApplicationRecord
  attachment :image
  has_many :favorites, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  def self.search(search)
    Farm.where(['name LIKE ? OR prefecture LIKE ? OR city LIKE? OR variety LIKE? OR breed LIKE?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
  end

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