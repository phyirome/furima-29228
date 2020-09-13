require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品の購入' do
    before do
      @buyer = FactoryBot.create(:user)
      # .createにしないとuser_idが生成されない。
      @seller = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id: @seller.id)
      # ここはなぜか.createでは動かない。
      @item.image = fixture_file_upload('public/images/test1.png')
      @item.save
      # @item.imageは@itemのFactoryBotで記述していないため、ここで書く必要がある。
      @purchase_address = FactoryBot.build(:purchase_address, user_id: @buyer.id, item_id: @item.id)
      # purchaseのためには買う人と、商品、それから商品を出品した人が必要。
      sleep(0.1)
    end

    context '商品の購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@purchase_address).to be_valid
        # binding.pry
      end
    end

    context '商品の購入ができないとき' do
      it 'postal_codeが空だと購入できない' do
        @purchase_address.postal_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code が空欄です')
      end
      it 'postal_codeがハイフン無しでは購入できない' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code は無効です。半角数字とハイフンで入力してください')
      end
      it 'postal_codeが全角では購入できない' do
        @purchase_address.postal_code = '１２３４-５６７'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code は無効です。半角数字とハイフンで入力してください')
      end
      it 'prefecture_idが空だと購入できない' do
        @purchase_address.prefecture_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Prefecture を選択してください')
      end
      it 'cityが空だと購入できない' do
        @purchase_address.city = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('City が空欄です')
      end
      it 'cityは半角文字を含むと購入できない' do
        @purchase_address.city = 'aaaあ'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('City は無効です。全角で入力してください')
      end
      it 'addressが空だと購入できない' do
        @purchase_address.address = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Address が空欄です')
      end
      # Buildingは空欄でも登録できる。
      it 'phone_numberが空だと購入できない' do
        @purchase_address.phone_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number が空欄です')
      end
      it 'phone_numberはハイフンを含むと購入できない' do
        @purchase_address.phone_number = '09-234-5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number は無効です。半角数字で入力してください')
      end
      it 'phone_numberは全角文字を含むと購入できない' do
        @purchase_address.phone_number = '０９０１２３４５６７８'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number は無効です。半角数字で入力してください')
      end
    end
  end
end
