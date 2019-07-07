FactoryBot.define do
  factory :profile do
    birthday = "#{Faker::Time.between(119.years.ago, Date.today, :all)}".split(" ")[0]
    nickname          { Faker::Name.name } 
    introduction      { Faker::Lorem.paragraphs }
    birthday          { birthday }
    family_name       { Faker::Name.last_name }
    first_name        { Faker::Name.first_name }
    # TODO 日本語のカタカナの名前の文字列を自動生成する機能を実装する
    family_name_kana  { "アベ" }
    first_name_kana   { "シンゾウ" }
  end

  def rand_dt(from = 0.0, to = Time.now)
    Time.at(from + rand * (to.to_f - from.to_f))
  end
end
