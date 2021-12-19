class CreateCultivatedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cultivated_items do |t|
      t.string :name
      t.timestamps
    end
  end
end
