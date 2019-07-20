class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  
  has_one :profile,          dependent: :destroy
  accepts_nested_attributes_for :profile
  has_one :user_address,     dependent: :destroy
  has_one :delivery_address, dependent: :destroy
  accepts_nested_attributes_for :delivery_address
  has_many :items
  
  with_options presence: true do
    validates :profit
    validates :point
  end
end
