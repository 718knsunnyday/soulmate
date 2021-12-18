class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.text :comment
      t.integer :public_id
      t.integer :farm_id

      t.timestamps
    end
  end
end
