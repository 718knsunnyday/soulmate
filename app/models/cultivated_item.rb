class CultivatedItem < ApplicationRecord
  has_many :farms, through: :farms_cultivated_items
  has_many :farms_cultivated_items, dependent: :destroy
end
