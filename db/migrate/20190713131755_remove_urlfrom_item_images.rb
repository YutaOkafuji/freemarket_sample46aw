class RemoveUrlfromItemImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :item_images, :url, :string
  end
end
