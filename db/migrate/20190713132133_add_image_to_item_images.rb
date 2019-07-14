class AddImageToItemImages < ActiveRecord::Migration[5.2]
  def change
    add_column :item_images, :image, :string, null: false
  end
end
