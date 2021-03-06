FactoryBot.define do
  factory :farmer do
    last_name { Faker::Lorem.characters(number: 10)}
    first_name { Faker::Lorem.characters(number: 10) }
    last_name_kana { Faker::Lorem.characters(number: 10) }
    first_name_kana { Faker::Lorem.characters(number: 10) }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password'}
  end
end