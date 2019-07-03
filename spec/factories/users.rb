FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(8)
    email { Faker::Internet.email }
    password { password }
<<<<<<< HEAD
    password_confirmation { password }
=======
    password_confirmation { password } 
>>>>>>> master
    profit { 0 }
    point { 0 }
  end
end
