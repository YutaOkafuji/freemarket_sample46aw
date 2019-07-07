class ChangeDatatypePrefectureOfUserAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column :user_addresses, :prefecture_id, :integer
  end
end
