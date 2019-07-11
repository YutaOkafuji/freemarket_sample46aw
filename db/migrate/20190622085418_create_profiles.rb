class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :nickname, null: false, length: { maximum: 20 }
      t.text :introduction
      t.date :birthday
      t.string :family_name, null: false
      t.string :first_name, null: false
      t.string :family_name_kana, null: false
      t.string :first_name_kana, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
