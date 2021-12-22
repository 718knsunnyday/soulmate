FactoryBot.define do
  factory :farm do
    #association :public
    name { Faker::Lorem.characters(number: 10)}
    manager { Faker::Lorem.characters(number: 10)}
    post_code { Faker::Lorem.characters(number: 7)}
    prefecture { Faker::Lorem.characters(number: 10)}
    city { Faker::Lorem.characters(number: 30)}
    house_number { Faker::Lorem.characters(number: 20)}
    breed { Faker::Lorem.characters(number: 20)}
    purchasing_method { Faker::Lorem.characters(number: 20)}
    contact { Faker::Lorem.characters(number: 20)}
    description { Faker::Lorem.characters(number: 50)}
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg'))}
    farmer
  end
end