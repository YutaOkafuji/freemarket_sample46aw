class AddUserRefToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :user,null: false, foreign_key: true
  end
end
