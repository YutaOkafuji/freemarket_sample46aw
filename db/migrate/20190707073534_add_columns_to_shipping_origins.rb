class AddColumnsToShippingOrigins < ActiveRecord::Migration[5.2]
  def change
    add_column :shipping_origins, :prefecture_id, :integer, null: false
    add_column :shipping_origins, :days_id, :integer, null: false
    add_column :shipping_origins, :method_id, :integer, null: false
    add_column :shipping_origins, :burden_id, :integer, null: false
  end
end
