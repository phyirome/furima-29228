require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameが空では新規登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    
    it 'emailが空では新規登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")

      # 疑問点1, @user.saveができない
    end
    
    it 'emailには@が含まれる' do
      expect(@user.email).to include ('@')
    end
    
    it 'passwordが空では新規登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    
    it 'passwordが6文字未満では登録できない' do
      @user.password = "1234a"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    
    it 'passwordが数字のみでは登録できない' do
      @user.password = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      # 疑問点3,@user.valid?の戻り値をfalseにしたり、エラー文を設定する方法が不明
    end
    
    it 'passwordが英字のみでは登録できない' do
      @user.password = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
    
    it 'passwordとpassword_confirmationが一致している' do
      @user.password_confirmation = "test"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'family_nameが空では新規登録できない' do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end

    it 'first_nameが空では新規登録できない' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    
    it 'family_nameが半角では登録できない' do
      @user.family_name = "ｱ"
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("Family name は全角文字を使用してください")
      # 疑問点4, なぜかエラーが生じる。意味がわからない。
    end
    
    it 'first_nameが半角では登録できない' do
      @user.first_name = "ｱ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name は全角文字を使用してください")
    end
    
    it 'kana_family_nameが空では新規登録できない' do
      @user.kana_family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana family name can't be blank")
    end
    
    it 'kana_first_nameが空では新規登録できない' do
      @user.kana_first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      # 疑問点5,こんなエラー文設定してない→これはdeviseの標準。
    end
    
    it 'kana_family_nameが半角では登録できない' do
      @user.kana_family_name = "ｱ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana family name は全角文字を使用してください")
    end
    
    it 'kana_first_nameが半角では登録できない' do
      @user.kana_first_name = "ｱ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first name は全角文字を使用してください")
    end
    
    it 'birthdayが空では新規登録できない' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

  end
end

