class RemoveUrlfromItemImagesAddPhoto < ActiveRecord::Migration[5.2]
  def change
    remove_column :item_images, :url, :string
    add_column :item_images, :photo, :string, null: false
  end
end
