class RenamePrefectureColumnToUserAddresses < ActiveRecord::Migration[5.2]
  def change
    rename_column :user_addresses, :prefecture, :prefecture_id
  end
end
