class RemoveColumnsFromShippingOrigins2 < ActiveRecord::Migration[5.2]
  def change
    remove_column :shipping_origins, :days_id, :integer
    remove_column :shipping_origins, :method_id, :integer
  end
end
