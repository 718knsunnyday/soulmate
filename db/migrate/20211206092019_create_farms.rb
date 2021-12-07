class CreateFarms < ActiveRecord::Migration[5.2]
  def change
    create_table :farms do |t|
      t.string :name, null: false
      t.string :manager, null: false
      t.string :post_code, null: false
      t.string :prefecture, null: false
      t.string :city, null: false
      t.string :house_number, null: false
      t.string :variety, null: false
      t.string :breed, null: false
      t.string :purchasing_method, null: false
      t.string :contact, null: false
      t.text :description, null: false
      t.string :image_id
      t.timestamps
    end
  end
end
