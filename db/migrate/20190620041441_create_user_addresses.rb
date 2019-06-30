class CreateUserAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_addresses do |t|
      t.string :zip_code, length: { maximum: 8 }
      t.string :prefecture
      t.string :city
      t.string :street_number
      t.string :building
      t.integer :user_id
      t.timestamps
    end
  end
end
