class RemoveColumnsFromShippingOrigins < ActiveRecord::Migration[5.2]
  def change
    remove_column :shipping_origins, :origin_region, :integer
    remove_column :shipping_origins, :shipping_day, :integer
    remove_column :shipping_origins, :shipping_method, :integer
    remove_column :shipping_origins, :shipping_burden, :boolean
  end
end
