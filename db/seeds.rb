# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Public.create!(
  last_name: "山田",
  first_name: "花子",
  last_name_kana: "ヤマダ",
  first_name_kana: "ハナコ",
  email: "yamadahanako@sample.com",
  password: "yamadahanako",
  is_valid: "true",
  )

Farmer.create!(
  last_name: "斉藤",
  first_name: "太郎",
  last_name_kana: "ノウカ",
  first_name_kana: "タロウ",
  email: "saitotaro@sample.com",
  password: "saitotaro",
  is_valid: "true",
  )

  
10.times do |n|
  Farmer.create!(
    email: "sample#{n + 1}@sample.com",
    last_name: "sample#{n + 1}",
    first_name: "sample#{n + 1}",
    last_name_kana: "sample#{n + 1}",
    first_name_kana: "sample#{n + 1}",
    password: "1111111",
    password_confirmation: "1111111"
  )
end

Farm.create!([
  {farmer_id: 1, name: "シャインマスカット農場", manager: "農家太郎",
  post_code: "123-4567", prefecture: "岡山県", city: "岡山市岡山町", house_number: "2",
  breed: "シャインマスカット", purchasing_method: "ネットで購入可能", contact: "http://meet-up-soulmate.com/",
  description: "皮まで食べることができ甘いのが特徴のシャインマスカットを生産してます。9月が旬なので、ぜひ9月に買いに農場まで来てください！",
  image: File.open("#{Rails.root}/app/assets/images/muscat.jpg")},
  
  {farmer_id: 2, name: "ブルーベリー農場", manager: "斉藤太郎",
  post_code: "123-4567", prefecture: "長野県", city: "須坂市", house_number: "2",
  breed: "ブルーベリー", purchasing_method: "農場で購入可能", contact: "http://meet-up-soulmate.com/",
  description: "太陽の光を存分に浴びた、甘いブルーベリーを生産してます。ブルーベリーを一緒に収穫してみませんか。ぜひ遊びに来てください！",
  image: File.open("#{Rails.root}/app/assets/images/berry.jpg")},
  ])
  
  10.times do |n|
    Farm.create!(
      farmer_id: 3,name: "sample#{n + 1}", manager: "sample#{n+1}",
      post_code: Faker::Address.postcode, prefecture: Gimei.unique.address.prefecture.kanji, city: Gimei.address.city.kanji, house_number: Gimei.town.kanji + "1-3",
      breed: "じゃがいも", purchasing_method: "ネットで購入可能", contact: "http://meet-up-soulmate.com/",
      description: "sample",
      image: File.open("#{Rails.root}/app/assets/images/sample.jpg"),
    )
  end
  
  10.times do |n|
    Farm.create!(
      farmer_id: 4,name: "sample#{n + 1}", manager: "sample#{n+1}",
      post_code: Faker::Address.postcode, prefecture: Gimei.unique.address.prefecture.kanji, city: Gimei.address.city.kanji, house_number: Gimei.town.kanji + "1-3",
      breed: "なす", purchasing_method: "ネットで購入可能", contact: "http://meet-up-soulmate.com/",
      description: "sample",
      image: File.open("#{Rails.root}/app/assets/images/eggplant.jpg"),
    )
  end
  
  10.times do |n|
    Farm.create!(
      farmer_id: 5,name: "sample#{n + 1}", manager: "sample#{n+1}",
      post_code: Faker::Address.postcode, prefecture: Gimei.unique.address.prefecture.kanji, city: Gimei.address.city.kanji, house_number: Gimei.town.kanji + "1-3",
      breed: "りんご", purchasing_method: "ネットで購入可能", contact: "http://meet-up-soulmate.com/",
      description: "sample",
      image: File.open("#{Rails.root}/app/assets/images/apple.jpg"),
    )
  end
  
  20.times do |n|
    Farm.create!(
      farmer_id: 6,name: "sample#{n + 1}", manager: "sample#{n+1}",
      post_code: Faker::Address.postcode, prefecture: Gimei.unique.address.prefecture.kanji, city: Gimei.address.city.kanji, house_number: Gimei.town.kanji + "1-3",
      breed: "米", purchasing_method: "ネットで購入可能", contact: "http://meet-up-soulmate.com/",
      description: "sample",
      image: File.open("#{Rails.root}/app/assets/images/rice.jpg"),
    )
  end
  
  20.times do |n|
    Farm.create!(
      farmer_id: 7,name: "sample#{n + 1}", manager: "sample#{n+1}",
      post_code: Faker::Address.postcode, prefecture: Gimei.unique.address.prefecture.kanji, city: Gimei.address.city.kanji, house_number: Gimei.town.kanji + "1-3",
      breed: "にんじん、ピーマン、米", purchasing_method: "ネットで購入可能", contact: "http://meet-up-soulmate.com/",
      description: "sample",
      image: File.open("#{Rails.root}/app/assets/images/rice.jpg"),
    )
  end
  
  Farm.all.ids.each do | farm_id |
    CultivatedItem.all.ids.each do |cultivated_item_id|
      FarmsCultivatedItem.create!(cultivated_item_id: cultivated_item_id, farm_id: farm_id)
    end
  end

CultivatedItem.create!([
  {name: "いも類"},
  {name: "根菜類"},
  {name: "鱗茎類"},
  {name: "豆類（種実）"},
  {name: "豆類（未成熟）"},
  {name: "うり類"},
  {name: "なす科果菜"},
  {name: "あぶらな科野菜"},
  {name: "葉菜類"},
  {name: "茎野菜類"},
  {name: "食用花類"},
  {name: "きのこ類"},
  {name: "穀類"},
  {name: "かんきつ類"},
  {name: "仁果類"},
  {name: "核果類"},
  {name: "ベリー類等の小粒果実類"},
  ])