Faker::Config.locale = :ja

FactoryBot.define do
  factory :user do
    id                    {1}
    nickname              {あべちゃん}
    email                 {Faker::Internet.free_email}
    password              {"00000000"}
    password_confirmation {"00000000"}
    profit                {0}
    point                 {0}
  end
end
