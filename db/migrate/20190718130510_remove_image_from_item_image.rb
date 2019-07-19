class RemoveImageFromItemImage < ActiveRecord::Migration[5.2]
  def change
    remove_column :item_images, :image, :string
  end
end
