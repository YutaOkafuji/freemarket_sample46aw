class RemoveItemToCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :item_id, :bigint
  end
end
