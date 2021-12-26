FactoryBot.define do
  factory :post_comment do
    comment { Faker::Lorem.characters(number: 10) }
    rate { Faker::Number.between(to: 5) }
    public
  end
end