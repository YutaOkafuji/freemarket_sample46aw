class ChangeDatatypePrefectureOfDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column :delivery_addresses, :prefecture_id, :integer
  end
end
