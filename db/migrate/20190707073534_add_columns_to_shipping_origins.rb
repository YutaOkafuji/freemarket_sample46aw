class AddColumnsToShippingOrigins < ActiveRecord::Migration[5.2]
  def change
    add_column :shipping_origins, :prefecture_id, :integer, null: false
    add_column :shipping_origins, :shipping_day_id, :integer, null: false
    add_column :shipping_origins, :shipping_method_id, :integer, null: false
    add_column :shipping_origins, :shipping_burden_id, :integer, null: false
  end
end
