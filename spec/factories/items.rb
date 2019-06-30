FactoryBot.define do
  factory :item, class: 'Items' do
    association :user
    name { Faker::Game.title }
    price { Faker::Number.between( 3, 9999999 )}
    description { Faker::Game.genre }
    sale_status {0}
    buy_status {0}
  end
end
