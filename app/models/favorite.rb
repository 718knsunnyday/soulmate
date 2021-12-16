class Favorite < ApplicationRecord
  validates :public_id, uniqueness: { scope: :farm_id }
  belongs_to :public
  belongs_to :farm
end
