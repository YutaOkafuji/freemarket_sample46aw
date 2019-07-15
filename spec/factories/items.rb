FactoryBot.define do
  factory :item do
    user
    name { Faker::Beer.name }
    price { Faker::Number.between( 3, 9999999 )}
    description { Faker::Beer.style }
    sale_status { 0 }
    buy_status { 0 }
  end

  factory :item_with_item_detail, class: Parent do
    user
    name { Faker::Beer.name }
    price { Faker::Number.between( 3, 9999999 )}
    description { Faker::Beer.style }
    sale_status { 0 }
    buy_status { 0 }

    after( :create ) do |parent|
      create :item_detail, parent: parent
    end
  end 
end
