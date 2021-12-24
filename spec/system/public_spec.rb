require 'rails_helper'

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
      it '編集ボタンが表示されているか' do
        expect(page).to have_button, '編集する'
      end
      it 'ブックマークボタンが表示されているか' do
        expect(page).to have_button, 'Bookmark一覧'
      end
    end
    context '農場の詳細ページのテスト' do
      let(:farm) {create(:farm)}
      before do
        visit farmer_farm_path(farm)
      end
      it '応援する文字が表示されているか' do
        expect(page).to have_content('応援する')
      end
    end
  end