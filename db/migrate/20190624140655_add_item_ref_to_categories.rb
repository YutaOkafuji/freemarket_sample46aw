class AddItemRefToCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :item, null: false, foreign_key: true
  end
end
