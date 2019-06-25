class CreateShippingOrigins < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_origins do |t|
      t.integer :origin_region, null: false
      t.integer :shipping_day, null: false
      t.integer :shipping_method, null: false
      t.boolean :shipping_burden, null: false
      t.references :item, null: false, foreign_key: true
      t.timestamps
    end
  end
end
