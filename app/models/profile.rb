class Profile < ApplicationRecord
  belongs_to :user
  with_options presence: true do
    validates :family_name
    validates :first_name
    validates :family_name_kana
    validates :first_name_kana
    validates :user_id
  end
end
