class Bookmark < ApplicationRecord
 
  validates_uniqueness_of :farm_id, scope: :public_id

  belongs_to :farm
  belongs_to :public
end
