class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.integer :public_id
      t.integer :farm_id
      t.timestamps
    end
  end
end
