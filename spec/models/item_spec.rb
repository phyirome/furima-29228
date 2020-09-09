require 'rails_helper'

RSpec.describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    it '商品名が空では登録できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Name が空欄です')
    end
    it '商品の説明が空では登録できない' do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Text が空欄です')
    end
    it 'カテゴリが空では登録できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Category を選択してください')
    end
    it '商品の状態が空では登録できない' do
      @item.condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition を選択してください')
    end
    it '配送料の負担が空では登録できない' do
      @item.shipping_fee_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping fee を選択してください')
    end
    it '発送元の地域が空では登録できない' do
      @item.shipping_from_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping from を選択してください')
    end
    it '発送までの日にちが空では登録できない' do
      @item.shipping_day_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping day を選択してください')
    end
    it '価格が空では登録できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Price が空欄です')
    end
    it '価格が300円未満では登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price は300円以上に設定してください')
    end
    it '価格が9,999,999円より高いと登録できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price は9,999,999円以下に設定してください')
    end
    it '価格が半角数字以外では登録できない' do
      @item.price = 'test'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price は半角数字で入力してください')
    end
  end
end
