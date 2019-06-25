Faker::Config.locale = :ja

FactoryBot.define do
  factory :profile do
    introduction      {"美しい国、日本!!"}
    birthday          {"19540921"}
    family_name       {"安倍"}
    first_name        {"晋三"}
    family_name_kana  {"abe"}
    first_name_kana   {"shinzo"}
  end
end
