class CreateDeals < ActiveRecord::Migration[5.2]
  def change
    create_table :deals do |t|
      t.integer :valuation
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
