class AddColumnsToShippingOrigins2 < ActiveRecord::Migration[5.2]
  def change
    add_column :shipping_origins, :delivery_date_id, :integer, null: false
    add_column :shipping_origins, :delivery_method_id, :integer, null: false
  end
end
