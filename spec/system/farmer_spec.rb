require 'rails_helper'

describe '農家のテスト' do
  let(:farmer) { build(:farmer) }
  let(:farm) {build(:farm)}
    context '新規登録成功後、マイページのテスト' do
    before do
      visit new_public_registration_path
      fill_in 'public[last_name]', with: farmer.last_name
      fill_in 'public[first_name]', with: farmer.first_name
      fill_in 'public[last_name_kana]', with: farmer.last_name_kana
      fill_in 'public[first_name_kana]', with: farmer.first_name_kana
      fill_in 'public[email]', with: farmer.email
      fill_in 'public[password]', with: farmer.password
      fill_in 'public[password_confirmation]', with: farmer.password
      click_button '新規登録する'
    end
      it 'ユーザー新規登録成功後登録した内容を表示' do
        expect(page).to have_content farmer.last_name
        expect(page).to have_content farmer.first_name
        expect(page).to have_content farmer.last_name_kana
        expect(page).to have_content farmer.first_name_kana
        expect(page).to have_content farmer.email
      end
      it '編集ボタンが表示されているか' do
        expect(page).to have_button, '編集する'
      end
      it '新規農場登録ボタンが表示されているか' do
        expect(page).to have_button, '新規農場登録'
      end
      it '農場新規登録のテスト' do
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
      end
    end
  end

  # describe '農家のテスト' do
  #   context 'ログイン成功後、農場新規登録のテスト' do
  #     let(:farmer) { create(:farmer)}
  #     let(:farm) { build(:farm)}
  #     let(:cultivated_item) {build(:cultivated_item)}
  #     let(:farms_cultivated_item) {build(:farms_cultivated_item)}
  #     before do
  #       visit new_farmer_session_path
  #       fill_in 'farmer[email]', with: farmer.email
  #       fill_in 'farmer[password]', with: farmer.password
  #       click_button 'ログイン'
  #       visit new_farmer_farm_path
  #       page.attach_file('farm[image]', Rails.root + 'spec/fixtures/test.jpg')
  #       fill_in 'farm[name]', with: farm.name
  #       fill_in 'farm[manager]', with: farm.manager
  #       fill_in 'farm[post_code]', with: farm.post_code
  #       fill_in 'farm[prefecture]', with: farm.prefecture
  #       fill_in 'farm[city]', with: farm.city
  #       fill_in 'farm[house_number]', with: farm.house_number
  #       fill_in 'farm[breed]', with: farm.breed
  #       fill_in 'farm[purchasing_method]', with: farm.purchasing_method
  #       fill_in 'farm[contact]', with: farm.contact
  #       fill_in 'farm[description]', with: farm.description
  #       click_button '新規農場を登録する'
  #     end
  #     it '農場の詳細ページのテスト' do
  #       expect(page).to have_content farm.name
  #     end
  #   end
  # end