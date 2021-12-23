require 'rails_helper'

describe '画面テスト' do
  #let!(:farmer){ create(:farmer)}
  #let(:farm){ create(:farm, farmer: farmer)}
  #let!(:public){ create(:public)}
  before do
    @public = create(:public)
    @farmer = create(:farmer)
    @farm = create(:farm)
  end
  describe 'トップページ' do
    before do
      visit root_path
    end
    context 'トップ画面表示のテスト' do
      it 'トップ画面にユーザーの新規登録画面ページへのリンクがあるか' do
        expect(page).to have_link "", href: new_public_registration_path
      end
      it 'トップ画面にユーザーのログイン画面ページへのリンクがあるか' do
        expect(page).to have_link "", href: new_public_session_path
      end
      it 'トップ画面に農家の新規登録画面ページへのリンクがあるか' do
        expect(page).to have_link "", href: new_farmer_registration_path
      end
      it 'トップ画面に農家のログイン画面ページへのリンクがあるか' do
        expect(page).to have_link "", href: new_farmer_session_path
      end
    end
    context 'ヘッダーのテスト(ログイン前)' do
      it 'ロゴのリンク先がroot_pathであるか' do
        expect(page).to have_link "", href: root_path
      end
      it 'サイトについてのリンクがあるか' do
        expect(page).to have_link "", href: about_path
      end
      it '地域別検索のリンクがあるか' do
        expect(page).to have_link "", href: farmer_prefecture_path
      end
      it '品目別検索のリンクがあるか' do
        expect(page).to have_link "", href: farmer_variety_path
      end
      it '農家一覧のリンクがあるか' do
        expect(page).to have_link "", href: farmer_farms_path
      end
    end
  end
  
  describe 'ユーザーテスト' do
      before do
        visit new_public_registration_path
      end
      it 'ユーザー新規登録成功時のテスト' do
      fill_in 'public[last_name]', with: @public.last_name
      fill_in 'public[first_name]', with: @public.first_name
      fill_in 'public[last_name_kana]', with: @public.last_name_kana
      fill_in 'public[first_name_kana]', with: @public.first_name_kana
      fill_in 'public[email]', with: @public.email
      fill_in 'public[password]', with: @public.password
      fill_in 'public[password_confirmation]', with: @public.password
      click_button '新規登録する'
      end
      before do
        visit new_public_session_path
      end
      it 'ユーザーログインのテスト' do
        fill_in 'public[email]', with: @public.email
        fill_in 'public[password]', with: @public.password
        click_button 'ログイン'
      end
  end
  
  describe '農家テスト' do
    before do
      visit new_farmer_registration_path
    end
    it '農家新規登録成功時のテスト' do
      fill_in 'farmer[last_name]', with: @farmer.last_name
      fill_in 'farmer[first_name]', with: @farmer.first_name
      fill_in 'farmer[last_name_kana]', with: @farmer.last_name_kana
      fill_in 'farmer[first_name_kana]', with: @farmer.first_name_kana
      fill_in 'farmer[email]', with: @farmer.email
      fill_in 'farmer[password]', with: @farmer.password
      fill_in 'farmer[password_confirmation]', with: @farmer.password
      click_button '新規登録する'
      end
  end
  
    describe '新規農場投稿入力画面のテスト' do
      before do
        visit new_farmer_farm_path
      end
      context '表示の確認' do
        it '新規農場投稿画面に「新規農場登録」が表示されているか' do
          expect(page).to have_content '新規農場登録'
        end
        it '投稿フォームが表示されているか' do
          expect(page).to have_field 'farm[name]'
          expect(page).to have_field 'farm[description]'
        end
        it '「新規農場を登録する」ボタンが表示されているか' do
          expect(page).to have_button '新規農場を登録する'
        end
      end

      context '投稿処理に関するテスト' do
        before do
          visit new_farmer_session_path
          fill_in 'farmer[email]', with: @farmer.email
          fill_in 'farmer[password]', with: @farmer.password
          click_button 'ログイン'
          visit new_farmer_farm_path
        end
        it '投稿に成功する' do
          fill_in 'farm[name]', with: Faker::Lorem.characters(number:10)
          fill_in 'farm[manager]', with: Faker::Lorem.characters(number:10)
          fill_in 'farm[post_code]', with: Faker::Lorem.characters(number:7)
          fill_in 'farm[prefecture]', with: Faker::Lorem.characters(number:10)
          fill_in 'farm[city]', with: Faker::Lorem.characters(number:10)
          fill_in 'farm[house_number]', with: Faker::Lorem.characters(number:10)
          fill_in 'farm[breed]', with: Faker::Lorem.characters(number:10)
          fill_in 'farm[purchasing_method]', with: Faker::Lorem.characters(number:10)
          fill_in 'farm[contact]', with: Faker::Lorem.characters(number:10)
          fill_in 'farm[description]', with: Faker::Lorem.characters(number:10)
          #fill_in 'farm[image_id]', with: 'spec/fixtures/test.jpg'
          click_button '新規農場を登録する'
        end
        it '農場詳細画面へ遷移する' do
          #expect(page).to have_current_path farmer_farm_path(farm)
        end
      end

      context '投稿に失敗する' do
        before do
          visit new_farmer_session_path
          fill_in 'farmer[email]', with: @farmer.email
          fill_in 'farmer[password]', with: @farmer.password
          click_button 'ログイン'
          visit new_farmer_farm_path
          fill_in 'farm[name]', with: Faker::Lorem.characters(number:10)
        end
        it '投稿が保存されない' do
          expect { click_button '新規農場を登録する' }.not_to change(Farm.all, :count)
        end
      end
    end

    #describe '農場詳細画面のテスト'
      #before do
        #visit farmer_farm_path(farm)
      #end
      #context '表示の確認' do

      #end
end