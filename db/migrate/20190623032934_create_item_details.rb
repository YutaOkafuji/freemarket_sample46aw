class CreateItemDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :item_details do |t|
      t.integer :size, null: false
      t.string :brand
      t.integer :condition, null: false
      t.references :item, null: false, foreign_key: true
      t.timestamps
    end
  end
end
