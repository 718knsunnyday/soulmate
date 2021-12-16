class Farm < ApplicationRecord
  attachment :image
  has_many :favorites, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  validates :name, presence: true
  validates :manager, presence: true
  validates :post_code, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :house_number, presence: true
  validates :variety, presence: true
  validates :breed, presence: true
  validates :purchasing_method, presence: true
  validates :contact, presence: true
  validates :description, presence: true
  validates :image_id, presence: true

  def self.search(search)
    Farm.where(['name LIKE ? OR prefecture LIKE ? OR city LIKE? OR variety LIKE? OR breed LIKE?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
  end

  def favorited_by?(current_public)
    favorites.where(public_id: current_public.id).exists?
  end

  def bookmarked_by?(current_public)
    bookmarks.where(public_id: current_public.id).exists?
  end

  def full_address
    '〒' + post_code + ' ' + prefecture + ' ' + city + ' ' + house_number
  end

end