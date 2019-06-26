class RemoveUserToProfiles < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :user, :integer
  end
end
