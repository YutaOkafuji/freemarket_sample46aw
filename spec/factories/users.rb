FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(8)
    email { Faker::Internet.email }
    password { password }
    password_confirmation { password }
    sale_status {0}
    buy_status {0}
    profit { 0 }
    point { 0 }
  end
end
