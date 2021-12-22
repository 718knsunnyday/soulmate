require 'rails_helper'

RSpec.describe Farm, 'Farmモデルのテスト', type: :model do
    before do
      @farm = create(:farm)
    end

    describe 'バリデーションのテスト' do
      it '農場名が空欄でないこと' do
        @farm.name = ''
        expect(@farm.valid?).to eq(false)
      end
      it '経営者が空欄でないこと' do
        @farm.manager = ''
        expect(@farm.valid?).to eq(false)
      end
      it '郵便番号が空欄でないこと' do
        @farm.post_code = ''
        expect(@farm.valid?).to eq(false)
      end
      it '都道府県が空欄でないこと' do
        @farm.prefecture = ''
        expect(@farm.valid?).to eq(false)
      end
      it '市区町村が空欄でないこと' do
        @farm.city = ''
        expect(@farm.valid?).to eq(false)
      end
      it '番地が空欄でないこと' do
        @farm.house_number = ''
        expect(@farm.valid?).to eq(false)
      end
      it '栽培品目例が空欄でないこと' do
        @farm.breed = ''
        expect(@farm.valid?).to eq(false)
      end
      it '購入方法が空欄でないこと' do
        @farm.purchasing_method = ''
        expect(@farm.valid?).to eq(false)
      end
      it 'コンタクトが空欄でないこと' do
        @farm.contact = ''
        expect(@farm.valid?).to eq(false)
      end
      it '説明が空欄でないこと' do
        @farm.description = ''
        expect(@farm.valid?).to eq(false)
      end
      it '説明が0文字であること' do
        @farm.description = Faker::Lorem.characters(number:0)
        expect(@farm.valid?).to eq(false)
      end
      it '説明が0文字であること' do
        @farm.description = Faker::Lorem.characters(number:1)
        expect(@farm.valid?).to eq(true)
      end
      it '説明が501文字以上であること' do
        @farm.description = Faker::Lorem.characters(number:501)
        expect(@farm.valid?).to eq(false)
      end
      it '画像が空欄でないこと' do
        @farm.image_id = ''
        expect(@farm.valid?).to eq(false)
      end
      it '農場情報の保存' do
        expect(@farm.valid?).to eq(true)
      end
    end

    describe '農場住所' do
      it '郵便番号・都道府県・市区町村・番地が書いてあること' do
        @farm = Farm.new(post_code: 123456, prefecture: "北海道", city: "札幌市札幌町", house_number: "1-1")
        expect(@farm.full_address).to eq("〒123456 北海道 札幌市札幌町 1-1")
      end
    end

    describe '検索' do
      it '検索したワードと部分一致した時' do
        expect(Farm.where(prefecture: "大阪府")).to include(@farm.prefecture)
      end
    end

end