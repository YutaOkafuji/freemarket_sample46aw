class CreateDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_addresses do |t|
      t.string :zip_code, null: false, length: { maximum: 8 }
      t.string :prefecture, null: false
      t.string :city, null: false
      t.string :street_number, null: false
      t.string :building
      t.string :telephone
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
