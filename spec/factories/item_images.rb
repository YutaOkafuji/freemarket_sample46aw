FactoryBot.define do
  factory :item_images do
    image { File.open("#{Rails.root}/spec/fixtures/test.png") }
    item
  end
end