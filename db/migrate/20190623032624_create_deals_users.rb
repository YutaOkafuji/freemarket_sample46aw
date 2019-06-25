class CreateDealsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :deals_users do |t|
      t.references :deal, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
