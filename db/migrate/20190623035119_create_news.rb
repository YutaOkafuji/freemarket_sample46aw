class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :title, null: false
      t.string :content, null: false 
      t.timestamps
    end
  end
end
