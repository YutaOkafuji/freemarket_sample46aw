class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string      :name, null: false
      t.integer     :price, null: false
      t.text        :description, null: false
      t.integer     :sale_status, null: false
      t.integer     :buy_status, null: false
      t.integer     :user_id
      t.timestamps
    end
  end
end
