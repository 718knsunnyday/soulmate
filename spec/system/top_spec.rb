require 'rails_helper'

describe 'トップページのテスト' do
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
    context 'ヘッダーのテスト（ユーザーログイン後）の表示' do
      let(:public_user) { create(:public) }
      before do
        visit new_public_session_path
        fill_in 'public[email]', with: public_user.email
        fill_in 'public[password]', with: public_user.password
        click_button 'ログイン'
      end
      it 'マイページのリンクがあるか' do
        expect(page).to have_link "", href: customer_path(public_user)
      end
      it 'ログアウトのリンクがあるか' do
        expect(page).to have_link "", href: destroy_public_session_path
      end
    end

    context 'ヘッダーのテスト（農家ログイン後）の表示' do
      let(:farmer) { create(:farmer) }
      before do
        visit new_farmer_session_path
        fill_in 'farmer[email]', with: farmer.email
        fill_in 'farmer[password]', with: farmer.password
        click_button 'ログイン'
      end
      it 'マイページのリンクがあるか' do
        expect(page).to have_link "", href: farmer_customer_path(farmer)
      end
      it 'ログアウトのリンクがあるか' do
        expect(page).to have_link "", href: destroy_farmer_session_path
      end
    end
  end

  # describe 'ユーザー新規登録・ログインのテスト' do
  #   let!(:public_user) { build(:public) }
  #   before do
  #     new_public_registration_path
  #     fill_in 'public[last_name]', with: public_user.last_name
  #     fill_in 'public[first_name]', with: public_user.first_name
  #     fill_in 'public[last_name_kana]', with: public_user.last_name_kana
  #     fill_in 'public[first_name_kana]', with: public_user.first_name_kana_name
  #     fill_in 'public[email]', with: public_user.email
  #     fill_in 'public[password]', with: public_user.password
  #     fill_in 'public[password_confirmation]', with: public_user.password_confirmation
  #     click_button '新規登録する'
  #   end
  #   it '新規登録成功後のマイページへ' do
  #     expect(page).to have_current_path customer_path(Public.last)
  #   end
  # end
  
  describe 'ユーザーのテスト' do
    context 'ユーザー新規登録後、マイページのテスト' do
    let(:public_user) { build(:public) }
    before do
      visit new_public_registration_path
      fill_in 'public[last_name]', with: public_user.last_name
      fill_in 'public[first_name]', with: public_user.first_name
      fill_in 'public[last_name_kana]', with: public_user.last_name_kana
      fill_in 'public[first_name_kana]', with: public_user.first_name_kana
      fill_in 'public[email]', with: public_user.email
      fill_in 'public[password]', with: public_user.password
      fill_in 'public[password_confirmation]', with: public_user.password
      click_button '新規登録する'
    end
      it 'ユーザー新規登録成功後登録した内容を表示' do
        expect(page).to have_content public_user.last_name
        expect(page).to have_content public_user.first_name
        expect(page).to have_content public_user.last_name_kana
        expect(page).to have_content public_user.first_name_kana
        expect(page).to have_content public_user.email
      end
    end
  end