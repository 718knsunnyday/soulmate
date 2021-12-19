class RemoveVarietyFromFarm < ActiveRecord::Migration[5.2]
  def change
    remove_column :farms, :variety, :string
  end
end
