class Favorite < ApplicationRecord

  validates_uniqueness_of :farm_id, scope: :public_id
  
  belongs_to :public
  belongs_to :farm
  
end
