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
      visit farmer_customer_path
    end
    it '編集ボタンが表示されているか' do
      expect(page).to have_button, '編集する'
    end
    it '新規農場登録ボタンが表示されているか' do
      expect(page).to have_button, '新規農場登録'
    end
  end
end