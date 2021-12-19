class CreateFarmsCultivatedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :farms_cultivated_items do |t|
      t.integer :cultivated_item_id
      t.integer :farm_id

      t.timestamps
    end
  end
end
