class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :avatar, :text
    add_column :users, :profit, :integer, null: false
    add_column :users, :point, :integer, null: false
  end
end
