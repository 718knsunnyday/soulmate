class Favorite < ApplicationRecord

  validates :farm_id, uniqueness: { scope: :farm_id }

  belongs_to :public
  belongs_to :farm
  
end
