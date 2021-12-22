class AddRateToPostComment < ActiveRecord::Migration[5.2]
  def change
    add_column :post_comments, :rate, :float
  end
end
