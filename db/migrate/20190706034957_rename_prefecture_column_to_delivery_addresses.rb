class RenamePrefectureColumnToDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    rename_column :delivery_addresses, :prefecture, :prefecture_id
  end
end
