class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.text   :introduction, null: false, length: { maximum: 20 }
      t.date   :birthday
      t.string :family_name,      null: false
      t.string :first_name,       null: false
      t.string :family_name_kana, null: false
      t.string :first_name_kana,  null: false
      t.references :user, foreign_key: true
      t.timestamps
      
    end
  end
end
