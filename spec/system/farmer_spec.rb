require 'rails_helper'

describe '農家のテスト' do
  let(:farmer) { create(:farmer) }
  before do
    visit new_farmer_session_path
    fill_in 'farmer[email]', with: farmer.email
    fill_in 'farmer[password]', with: farmer.password
    click_button 'ログイン'
  end

  describe '農家のマイページのテスト' do
    before do
      visit farmer_customer_path(farmer)
    end
    it '自分の登録情報（名前・メールアドレス）表示' do
      expect(page).to have_content farmer.last_name
      expect(page).to have_content farmer.first_name
      expect(page).to have_content farmer.last_name_kana
      expect(page).to have_content farmer.first_name_kana
    end
    it '編集ボタンが表示されているか' do
      expect(page).to have_button, '編集する'
    end
    it '新規農場登録ボタンが表示されているか' do
      expect(page).to have_button, '新規農場登録'
    end
  end

  describe '農場新規登録のテスト' do
    let(:farm) {create(:farm)}
    let(:cultivated_item) {create(:cultivated_item)}
    let(:farms_cultivated_item) {create(:farms_cultivated_item, farm: farm, cultivated_item: cultivated_item)}

    context '新規農場登録画面のテスト' do
    before do
    visit new_farmer_farm_path
    end
      it '農場名フォームが表示されているか' do
        expect(page).to have_field 'farm[name]'
      end
      it '農場説明フォームが表示されているか' do
        expect(page).to have_field 'farm[description]'
      end
      it '投稿登録後、農場詳細画面が表示されているか' do
        fill_in 'farm[name]', with: farm.name
        fill_in 'farm[manager]', with: farm.manager
        fill_in 'farm[post_code]', with: farm.post_code
        fill_in 'farm[prefecture]', with: farm.prefecture
        fill_in 'farm[city]', with: farm.city
        fill_in 'farm[house_number]', with: farm.house_number
        fill_in 'farm[breed]', with: farm.breed
        fill_in 'farm[purchasing_method]', with: farm.purchasing_method
        fill_in 'farm[contact]', with: farm.contact
        fill_in 'farm[description]', with: farm.description
        click_button '新規農場を登録する'
        expect(page).to have_current_path farmer_farm_path(Farm.last)
      end
    end
    context '農場詳細画面のテスト' do
      before do
        visit farmer_farm_path(farm)
      end
      it '登録した農場名が表示されているか' do
        expect(page).to have_content farm.name
      end
      it '登録した栽培品目が表示されているか' do
        expect(page).to have_content farms_cultivated_item.id
      end
      it '登録した農場説明が表示されているか' do
        expect(page).to have_content farm.description
      end
    end
    context '農場一覧画面のテスト' do
      before do
        visit new_farmer_farm_path
        fill_in 'farm[name]', with: farm.name
        fill_in 'farm[manager]', with: farm.manager
        fill_in 'farm[post_code]', with: farm.post_code
        fill_in 'farm[prefecture]', with: farm.prefecture
        fill_in 'farm[city]', with: farm.city
        fill_in 'farm[house_number]', with: farm.house_number
        fill_in 'farm[breed]', with: farm.breed
        fill_in 'farm[purchasing_method]', with: farm.purchasing_method
        fill_in 'farm[contact]', with: farm.contact
        fill_in 'farm[description]', with: farm.description
        click_button '新規農場を登録する'
        visit farmer_farms_path
      end
      it '新着順のリンクが表示されているか' do
        expect(page).to have_link "", href: farmer_farms_path(sort: 'created_at DESC')
      end
      it 'ランキングのリンクが表示されているか' do
        expect(page).to have_link "", href: farmer_farm_ranking_path
      end
      it '登録している農場名が表示されているか' do
        expect(page).to have_content farm.name
      end
      it '登録している住所が表示されているか' do
        expect(page).to have_content farm.full_address
      end
      it '登録している栽培品目例が表示されているか' do
        expect(page).to have_content farm.breed
      end
      it '農場名が農場詳細リンクになっているか' do
        expect(page).to have_link "", href: farmer_farm_path(farm)
      end
    end
  end
end