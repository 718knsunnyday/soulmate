require 'rails_helper'

RSpec.describe public, 'publicモデルのテスト', type: :model do
  before do
    @public = build(:public)
  end

  describe 'バリデーションのテスト' do

    it '姓が空欄ではないこと' do
      @public.first_name = ''
      expect(@public.valid?).to eq(false)
    end
    it '名が空欄ではないこと' do
      @public.last_name = ''
      expect(@public.valid?).to eq(false)
    end
    it 'セイが空欄ではないこと' do
      @public.first_name_kana = ''
      expect(@public.valid?).to eq(false)
    end
    it 'メイが空欄ではないこと' do
      @public.last_name_kana = ''
      expect(@public.valid?).to eq(false)
    end
    it 'メールアドレスが空欄ではないこと' do
      @public.email = ''
      expect(@public.valid?).to eq(false)
    end
  end

  before do
    @public = create(:public)
  end

  describe '保存されているかの確認' do
    it '姓名、フリガナ、メールアドレス、パスワードが保存されていること' do
      expect(@public.valid?).to eq(true)
    end
  end
end
