require 'rails_helper'

RSpec.describe Farmer, 'Farmerモデルのテスト', type: :modele do
  before do
    @farmer = build(:farmer)
  end

  describe 'バリデーションのテスト' do

    it '姓が空欄ではないこと' do
      @farmer.first_name = ''
      expect(@farmer.valid?).to eq(false)
    end
    it '名が空欄ではないこと' do
      @farmer.last_name = ''
      expect(@farmer.valid?).to eq(false)
    end
    it 'セイが空欄ではないこと' do
      @farmer.first_name_kana = ''
      expect(@farmer.valid?).to eq(false)
    end
    it 'メイが空欄ではないこと' do
      @farmer.last_name_kana = ''
      expect(@farmer.valid?).to eq(false)
    end
    it 'メールアドレスが空欄ではないこと' do
      @farmer.email = ''
      expect(@farmer.valid?).to eq(false)
    end
  end
end

