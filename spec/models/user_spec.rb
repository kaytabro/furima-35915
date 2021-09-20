require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it 'nicknameとemail、password、password_confirmationと本人情報確認が存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it "emailが値が一意でないとは登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include 'Email has already been taken'
    end
    it "emailが値が@を含んでいないと登録できない" do
      @user.email = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it "passwordが5文字以下では登録できない（6文字以上の入力が必要）" do
      @user.password = '123ab'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end
    it "passwordが半角英数字混合でないと登録できない(数字のみ)" do
      @user.password = '123456'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定してください'
    end
    it "passwordが半角英数字混合でないと登録できない(英字のみ)" do
      @user.password = 'abcdef'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定してください'
    end
    it "全角文字を含むパスワードでは登録できない" do
      @user.password = 'あ123ab'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定してください'
    end
    it "passwordとpassword_confiremationの値が一致していないと登録できない" do
      @user.password = '123abc'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
  end

  describe "ユーザー本人情報確認" do
    it "お名前(全角)の名前が空では登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it "お名前(全角)の名字が空では登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it "お名前(全角)の名前が全角（漢字・ひらがな・カタカナ）以外を含むと登録できない" do
      @user.first_name = 'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name には全角文字を使用してください"
    end
    it "お名前(全角)の名字が全角（漢字・ひらがな・カタカナ）以外を含むと登録できない" do
      @user.last_name = 'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name には全角文字を使用してください"
    end
    it "お名前カナ(全角)の名前が空では登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it "お名前カナ(全角)の名字が空では登録できない" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end
    it "お名前(全角)の名前が全角（カタカナ）以外を含むと登録できない" do
      @user.first_name_kana = 'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana には全角カナを使用してください"
    end
    it "お名前(全角)の名字が全角（カタカナ）以外を含むと登録できない" do
      @user.last_name_kana = 'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana には全角カナを使用してください"
    end
    it "生年月日が空では登録できない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end

end
