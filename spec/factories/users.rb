FactoryBot.define do
  factory :user do
    id                    {1}
    email                 {"aaa@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    profit                {0}
    point                 {0}
  end
end
