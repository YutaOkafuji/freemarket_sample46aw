class RemoveColumnsFromItemDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column :item_details, :size, :integer
    remove_column :item_details, :condition, :integer
  end
end
