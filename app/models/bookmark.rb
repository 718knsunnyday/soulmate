class Bookmark < ApplicationRecord
  validates :public_id, uniqueness: { scope: :farm_id }

  belongs_to :farm
  belongs_to :public
end
