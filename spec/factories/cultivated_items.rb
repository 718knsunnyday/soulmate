FactoryBot.define do
  factory :cultivated_item do
    name { Faker::Lorem.characters(number: 10)}
  end
end
