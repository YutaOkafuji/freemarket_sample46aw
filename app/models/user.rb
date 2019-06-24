class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile
  with_options presence: true do
    validates :nickname
    validates :profit
    validates :point
  end
  validates :nickname, length: {maximum: 20}
end
