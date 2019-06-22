class AddColumnsUsers < ActiveRecord::Migration[5.2]
  def change
      add_column :users, :nickname, :string,  null: false, unique: true
      add_column :users, :avator,   :text
      add_column :users, :profit,   :integer, null:false
      add_column :users, :point,    :integer, null:false 
  end
end
