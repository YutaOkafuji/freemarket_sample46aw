class ChangeColumnOfShippingOrigins < ActiveRecord::Migration[5.2]
  def up
    change_column :shipping_origins, :delivery_method_id, :integer , null: true
  end
  def down
    change_column :shipping_origins, :delivery_method_id, :integer , null: false
  end
end
