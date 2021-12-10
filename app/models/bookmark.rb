class Bookmark < ApplicationRecord
  validates :farm_id, uniqueness: { scope: :farm_id }

  belongs_to :farm
  belongs_to :public
end
