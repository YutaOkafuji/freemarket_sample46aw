class AddPhotToItemImage < ActiveRecord::Migration[5.2]
  def change
    add_column :item_images, :phot, :string, null: false
  end
end
