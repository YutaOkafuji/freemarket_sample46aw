class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :parent_id, null: false
      t.references :item, null: false
      t.timestamps
    end
  end
end
