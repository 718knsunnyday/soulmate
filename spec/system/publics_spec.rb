require 'rails_helper'

describe 'ユーザーのテスト' do
  let(:public_user) { create(:public) }
  let(:farmer) { create(:farmer) }
  let(:farm) { create(:farm, farmer: farmer)}
  let(:post_comment) { create(:post_comment, farm: farm, public: public_user) }
  let(:cultivated_item) {create(:cultivated_item)}
  let(:farms_cultivated_item) {create(:farms_cultivated_item, farm: farm, cultivated_item: cultivated_item)}
  before do
    visit new_public_session_path
    fill_in 'public[email]', with: public_user.email
    fill_in 'public[password]', with: public_user.password
    click_button 'ログイン'
  end
  context 'ユーザーのマイページ詳細テスト' do
    before do
      visit customer_path(public_user)
    end
    it '自分の登録情報（名前・メールアドレス）表示' do
      expect(page).to have_content public_user.last_name
      expect(page).to have_content public_user.first_name
      expect(page).to have_content public_user.last_name_kana
      expect(page).to have_content public_user.first_name_kana
    end
    it '編集ボタンが表示されているか' do
      expect(page).to have_button, '編集する'
    end
    it 'Bookmark一覧ボタンが表示されているか' do
      expect(page).to have_button, 'Bookmark一覧'
    end
  end
  context 'マイページ編集テスト' do
    before do
      visit edit_farmer_customer_path
    end
    it '登録した'
  end
  context '農場詳細画面(ユーザーのみが表示される機能)のテスト' do
    before do
      visit farmer_farm_path(farm)
    end
    it '応援ボタンが表示されているか' do
      expect(page).to have_content '応援ボタン'
    end
    it 'ブックマークが表示されているか' do
      expect(page).to have_content 'ブックマーク'
    end
    it 'コメントフォームが表示されているか' do
      expect(page).to have_field 'post_comment[comment]'
    end
    it 'コメントの投稿テスト' do
      Capybara.current_session.driver.header('accept', 'application/javascript')
      fill_in 'post_comment[comment]', with: post_comment.comment
      find('#rate_field', visible: false).set post_comment.rate
      click_button '送信'
      expect(page).to have_content post_comment.comment
    end
  end
end