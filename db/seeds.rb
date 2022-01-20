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

  
17.times do |n|
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
  
  5.times do |n|
    Farm.create!(
      farmer_id: 3, name: "sample#{n + 1}", manager: "sample#{n+1}",
      post_code: Faker::Address.postcode, prefecture: Gimei.unique.address.prefecture.kanji, city: Gimei.address.city.kanji, house_number: Gimei.town.kanji + "1-1",
      breed: "じゃがいも", purchasing_method: "ネットで購入可能", contact: "http://meet-up-soulmate.com/",
      description: "sample",
      image: File.open("#{Rails.root}/app/assets/images/potato.jpg")
    )
  end
  
  5.times do |n|
    Farm.create!(
      farmer_id: 4,name: "sample#{n + 1}", manager: "sample#{n+1}",
      post_code: Faker::Address.postcode, prefecture: Gimei.unique.address.prefecture.kanji, city: Gimei.address.city.kanji, house_number: Gimei.town.kanji + "1-2",
      breed: "にんじん", purchasing_method: "ネットで購入可能", contact: "http://meet-up-soulmate.com/",
      description: "sample",
      image: File.open("#{Rails.root}/app/assets/images/carrot.jpg")
    )
  end
  
  5.times do |n|
    Farm.create!(
      farmer_id: 5,name: "sample#{n + 1}", manager: "sample#{n+1}",
      post_code: Faker::Address.postcode, prefecture: Gimei.unique.address.prefecture.kanji, city: Gimei.address.city.kanji, house_number: Gimei.town.kanji + "1-3",
      breed: "玉ねぎ", purchasing_method: "ネットで購入可能", contact: "http://meet-up-soulmate.com/",
      description: "sample",
      image: File.open("#{Rails.root}/app/assets/images/onion.jpg")
    )
  end
  
  5.times do |n|
    Farm.create!(
      farmer_id: 6,name: "sample#{n + 1}", manager: "sample#{n+1}",
      post_code: Faker::Address.postcode, prefecture: Gimei.unique.address.prefecture.kanji, city: Gimei.address.city.kanji, house_number: Gimei.town.kanji + "1-4",
      breed: "ピーナッツ", purchasing_method: "ネットで購入可能", contact: "http://meet-up-soulmate.com/",
      description: "sample",
      image: File.open("#{Rails.root}/app/assets/images/peanuts.jpg")
    )
  end
  
  5.times do |n|
    Farm.create!(
      farmer_id: 7,name: "sample#{n + 1}", manager: "sample#{n+1}",
      post_code: Faker::Address.postcode, prefecture: Gimei.unique.address.prefecture.kanji, city: Gimei.address.city.kanji, house_number: Gimei.town.kanji + "1-5",
      breed: "えんどう豆", purchasing_method: "ネットで購入可能", contact: "http://meet-up-soulmate.com/",
      description: "sample",
      image: File.open("#{Rails.root}/app/assets/images/beans.jpg")
    )
  end
  
  5.times do |n|
    Farm.create!(
      farmer_id: 8,name: "sample#{n + 1}", manager: "sample#{n+1}",
      post_code: Faker::Address.postcode, prefecture: Gimei.unique.address.prefecture.kanji, city: Gimei.address.city.kanji, house_number: Gimei.town.kanji + "1-6",
      breed: "なす", purchasing_method: "ネットで購入可能", contact: "http://meet-up-soulmate.com/",
      description: "sample",
      image: File.open("#{Rails.root}/app/assets/images/eggplant.jpg")
    )
  end
  
  5.times do |n|
    Farm.create!(
      farmer_id: 9,name: "sample#{n + 1}", manager: "sample#{n+1}",
      post_code: Faker::Address.postcode, prefecture: Gimei.unique.address.prefecture.kanji, city: Gimei.address.city.kanji, house_number: Gimei.town.kanji + "1-7",
      breed: "ズッキーニ", purchasing_method: "ネットで購入可能", contact: "http://meet-up-soulmate.com/",
      description: "sample",
      image: File.open("#{Rails.root}/app/assets/images/courgette.jpg")
    )
  end
  
  5.times do |n|
    Farm.create!(
      farmer_id: 10,name: "sample#{n + 1}", manager: "sample#{n+1}",
      post_code: Faker::Address.postcode, prefecture: Gimei.unique.address.prefecture.kanji, city: Gimei.address.city.kanji, house_number: Gimei.town.kanji + "1-8",
      breed: "ブロッコリー", purchasing_method: "ネットで購入可能", contact: "http://meet-up-soulmate.com/",
      description: "sample",
      image: File.open("#{Rails.root}/app/assets/images/broccoli.jpg")
    )
  end
  
  5.times do |n|
    Farm.create!(
      farmer_id: 11,name: "sample#{n + 1}", manager: "sample#{n+1}",
      post_code: Faker::Address.postcode, prefecture: Gimei.unique.address.prefecture.kanji, city: Gimei.address.city.kanji, house_number: Gimei.town.kanji + "1-9",
      breed: "白菜", purchasing_method: "ネットで購入可能", contact: "http://meet-up-soulmate.com/",
      description: "sample",
      image: File.open("#{Rails.root}/app/assets/images/vegetable.jpg")
    )
  end
  
  5.times do |n|
    Farm.create!(
      farmer_id: 12,name: "sample#{n + 1}", manager: "sample#{n+1}",
      post_code: Faker::Address.postcode, prefecture: Gimei.unique.address.prefecture.kanji, city: Gimei.address.city.kanji, house_number: Gimei.town.kanji + "1-10",
      breed: "アスパラガス", purchasing_method: "ネットで購入可能", contact: "http://meet-up-soulmate.com/",
      description: "sample",
      image: File.open("#{Rails.root}/app/assets/images/asparagus.jpg")
    )
  end
  
  5.times do |n|
    Farm.create!(
      farmer_id: 13,name: "sample#{n + 1}", manager: "sample#{n+1}",
      post_code: Faker::Address.postcode, prefecture: Gimei.unique.address.prefecture.kanji, city: Gimei.address.city.kanji, house_number: Gimei.town.kanji + "2-1",
      breed: "パンジー", purchasing_method: "ネットで購入可能", contact: "http://meet-up-soulmate.com/",
      description: "sample",
      image: File.open("#{Rails.root}/app/assets/images/garden.jpg")
    )
  end
  
  5.times do |n|
    Farm.create!(
      farmer_id: 14,name: "sample#{n + 1}", manager: "sample#{n+1}",
      post_code: Faker::Address.postcode, prefecture: Gimei.unique.address.prefecture.kanji, city: Gimei.address.city.kanji, house_number: Gimei.town.kanji + "2-2",
      breed: "米", purchasing_method: "ネットで購入可能", contact: "http://meet-up-soulmate.com/",
      description: "sample",
      image: File.open("#{Rails.root}/app/assets/images/rice.jpg")
    )
  end
  
  5.times do |n|
    Farm.create!(
      farmer_id: 15,name: "sample#{n + 1}", manager: "sample#{n+1}",
      post_code: Faker::Address.postcode, prefecture: Gimei.unique.address.prefecture.kanji, city: Gimei.address.city.kanji, house_number: Gimei.town.kanji + "2-3",
      breed: "もも", purchasing_method: "ネットで購入可能", contact: "http://meet-up-soulmate.com/",
      description: "sample",
      image: File.open("#{Rails.root}/app/assets/images/peach.jpg")
    )
  end
  
  5.times do |n|
    Farm.create!(
      farmer_id: 16,name: "sample#{n + 1}", manager: "sample#{n+1}",
      post_code: Faker::Address.postcode, prefecture: Gimei.unique.address.prefecture.kanji, city: Gimei.address.city.kanji, house_number: Gimei.town.kanji + "2-4",
      breed: "ゆず", purchasing_method: "ネットで購入可能", contact: "http://meet-up-soulmate.com/",
      description: "sample",
      image: File.open("#{Rails.root}/app/assets/images/yuzu.jpg")
    )
  end
  
  5.times do |n|
    Farm.create!(
      farmer_id: 5,name: "sample#{n + 1}", manager: "sample#{n+1}",
      post_code: Faker::Address.postcode, prefecture: Gimei.unique.address.prefecture.kanji, city: Gimei.address.city.kanji, house_number: Gimei.town.kanji + "2-5",
      breed: "りんご", purchasing_method: "ネットで購入可能", contact: "http://meet-up-soulmate.com/",
      description: "sample",
      image: File.open("#{Rails.root}/app/assets/images/apple.jpg")
    )
  end
  
  5.times do |n|
    Farm.create!(
      farmer_id: 5,name: "sample#{n + 1}", manager: "sample#{n+1}",
      post_code: Faker::Address.postcode, prefecture: Gimei.unique.address.prefecture.kanji, city: Gimei.address.city.kanji, house_number: Gimei.town.kanji + "1-15",
      breed: "エリンギ", purchasing_method: "ネットで購入可能", contact: "http://meet-up-soulmate.com/",
      description: "sample",
      image: File.open("#{Rails.root}/app/assets/images/mushroom.jpg")
    )
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
  
  # Farm.all.ids.each do | farm_id |
  #   CultivatedItem.all.ids.each do |cultivated_item_id|
  #     FarmsCultivatedItem.create!(cultivated_item_id: cultivated_item_id, farm_id: farm_id)
  #   end
  # end
  
  farm = [
          {:farm_id => 1, :cultivated_item => ["ベリー類等の小粒果実類"]},
          {:farm_id => 2, :cultivated_item => ["ベリー類等の小粒果実類"]},
          {:farm_id => 3, :cultivated_item => ["いも類"]},
          {:farm_id => 4, :cultivated_item => ["いも類"]},
          {:farm_id => 5, :cultivated_item => ["いも類"]},
          {:farm_id => 6, :cultivated_item => ["いも類"]},
          {:farm_id => 7, :cultivated_item => ["いも類"]},
          {:farm_id => 8, :cultivated_item => ["根菜類"]},
          {:farm_id => 9, :cultivated_item => ["根菜類"]},
          {:farm_id => 10, :cultivated_item => ["根菜類"]},
          {:farm_id => 11, :cultivated_item => ["根菜類"]},
          {:farm_id => 12, :cultivated_item => ["根菜類"]},
          {:farm_id => 13, :cultivated_item => ["鱗茎類"]},
          {:farm_id => 14, :cultivated_item => ["鱗茎類"]},
          {:farm_id => 15, :cultivated_item => ["鱗茎類"]},
          {:farm_id => 16, :cultivated_item => ["鱗茎類"]},
          {:farm_id => 17, :cultivated_item => ["鱗茎類"]},
          {:farm_id => 18, :cultivated_item => ["豆類（種実）"]},
          {:farm_id => 19, :cultivated_item => ["豆類（種実）"]},
          {:farm_id => 20, :cultivated_item => ["豆類（種実）"]},
          {:farm_id => 21, :cultivated_item => ["豆類（種実）"]},
          {:farm_id => 22, :cultivated_item => ["豆類（種実）"]},
          {:farm_id => 23, :cultivated_item => ["豆類（未成熟）"]},
          {:farm_id => 24, :cultivated_item => ["豆類（未成熟）"]},
          {:farm_id => 25, :cultivated_item => ["豆類（未成熟）"]},
          {:farm_id => 26, :cultivated_item => ["豆類（未成熟）"]},
          {:farm_id => 27, :cultivated_item => ["豆類（未成熟）"]},
          {:farm_id => 28, :cultivated_item => ["なす科果菜"]},
          {:farm_id => 29, :cultivated_item => ["なす科果菜"]},
          {:farm_id => 30, :cultivated_item => ["なす科果菜"]},
          {:farm_id => 31, :cultivated_item => ["なす科果菜"]},
          {:farm_id => 32, :cultivated_item => ["なす科果菜"]},
          {:farm_id => 33, :cultivated_item => ["うり類"]},
          {:farm_id => 34, :cultivated_item => ["うり類"]},
          {:farm_id => 35, :cultivated_item => ["うり類"]},
          {:farm_id => 36, :cultivated_item => ["うり類"]},
          {:farm_id => 37, :cultivated_item => ["うり類"]},
          {:farm_id => 38, :cultivated_item => ["あぶらな科野菜"]},
          {:farm_id => 39, :cultivated_item => ["あぶらな科野菜"]},
          {:farm_id => 40, :cultivated_item => ["あぶらな科野菜"]},
          {:farm_id => 41, :cultivated_item => ["あぶらな科野菜"]},
          {:farm_id => 42, :cultivated_item => ["あぶらな科野菜"]},
          {:farm_id => 43, :cultivated_item => ["葉菜類"]},
          {:farm_id => 44, :cultivated_item => ["葉菜類"]},
          {:farm_id => 45, :cultivated_item => ["葉菜類"]},
          {:farm_id => 46, :cultivated_item => ["葉菜類"]},
          {:farm_id => 47, :cultivated_item => ["葉菜類"]},
          {:farm_id => 48, :cultivated_item => ["茎野菜類"]},
          {:farm_id => 49, :cultivated_item => ["茎野菜類"]},
          {:farm_id => 50, :cultivated_item => ["茎野菜類"]},
          {:farm_id => 51, :cultivated_item => ["茎野菜類"]},
          {:farm_id => 52, :cultivated_item => ["茎野菜類"]},
          {:farm_id => 53, :cultivated_item => ["食用花類"]},
          {:farm_id => 54, :cultivated_item => ["食用花類"]},
          {:farm_id => 55, :cultivated_item => ["食用花類"]},
          {:farm_id => 56, :cultivated_item => ["食用花類"]},
          {:farm_id => 57, :cultivated_item => ["食用花類"]},
          {:farm_id => 58, :cultivated_item => ["穀類"]},
          {:farm_id => 59, :cultivated_item => ["穀類"]},
          {:farm_id => 60, :cultivated_item => ["穀類"]},
          {:farm_id => 61, :cultivated_item => ["穀類"]},
          {:farm_id => 62, :cultivated_item => ["穀類"]},
          {:farm_id => 63, :cultivated_item => ["核果類"]},
          {:farm_id => 64, :cultivated_item => ["核果類"]},
          {:farm_id => 65, :cultivated_item => ["核果類"]},
          {:farm_id => 66, :cultivated_item => ["核果類"]},
          {:farm_id => 67, :cultivated_item => ["核果類"]},
          {:farm_id => 68, :cultivated_item => ["かんきつ類"]},
          {:farm_id => 69, :cultivated_item => ["かんきつ類"]},
          {:farm_id => 70, :cultivated_item => ["かんきつ類"]},
          {:farm_id => 71, :cultivated_item => ["かんきつ類"]},
          {:farm_id => 72, :cultivated_item => ["かんきつ類"]},
          {:farm_id => 73, :cultivated_item => ["仁果類"]},
          {:farm_id => 74, :cultivated_item => ["仁果類"]},
          {:farm_id => 75, :cultivated_item => ["仁果類"]},
          {:farm_id => 76, :cultivated_item => ["仁果類"]},
          {:farm_id => 77, :cultivated_item => ["仁果類"]},
          {:farm_id => 78, :cultivated_item => ["きのこ類"]},
          {:farm_id => 79, :cultivated_item => ["きのこ類"]},
          {:farm_id => 80, :cultivated_item => ["きのこ類"]},
          {:farm_id => 81, :cultivated_item => ["きのこ類"]},
          {:farm_id => 82, :cultivated_item => ["きのこ類"]},
        ]
  
  farm.each do |i|
    i[:cultivated_item].each do |name|                                                                                                                 
      cultivated_item = CultivatedItem.find_by(name: name) 
      FarmsCultivatedItem.create!(cultivated_item_id: cultivated_item.id, farm_id: i[:farm_id]) 
    end  
  end  
