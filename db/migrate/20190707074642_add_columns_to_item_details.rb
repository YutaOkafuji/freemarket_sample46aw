class AddColumnsToItemDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :item_details, :size_id, :integer
    add_column :item_details, :condition_id, :integer, null: false
  end
end
