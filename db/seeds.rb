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
  email: "sitotaro@sample.com",
  password: "saitotaro",
  is_valid: "true",
  )

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