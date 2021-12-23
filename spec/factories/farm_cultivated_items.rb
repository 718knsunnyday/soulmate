FactoryBot.define do
  factory :farms_cultivated_item do
    cultivated_item_id { Faker::Lorem.characters(number: 10) }
    farm_id { Faker::Lorem.characters(number: 10) }
  end
end