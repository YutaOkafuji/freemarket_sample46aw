class Profile < ApplicationRecord
  belongs_to :user
  with_options presence: true do
    validates :nickname
    validates :family_name
    validates :first_name
    validates :family_name_kana
    validates :first_name_kana 
    validates :birthday
  end
  validates :nickname, length: {maximum: 20}
end
