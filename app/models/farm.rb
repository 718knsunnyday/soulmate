class Farm < ApplicationRecord
  attachment :image

  enum variety: { tuberous_and_corm_vegetables: 0, root_vegetables: 1, bulb_vegetables: 2, pulses: 3, legume_vegetables: 4, cucurbits: 5, solanaceous_plants: 6,
                  brassica_vegetables: 7, leafy_vegetables: 8, stalk_and_stem_vegetables: 9, edible_flowers: 10,
                  edible_fungi: 11, cereal_grains: 12, citrus_fruits: 13, pome_fruits: 14, stone_fruits: 15, berries: 16}
end