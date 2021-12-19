class FarmsCultivatedItem < ApplicationRecord
  belongs_to :farm
  belongs_to :cultivated_item
end

