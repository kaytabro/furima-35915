require 'rails_helper'
RSpec.describe User, type: :model do

  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
    end
    it "emailが空では登録できない" do
    end
    it "emailが値が一意でないとは登録できない" do
    end
    it "emailが値が@を含んでないとは登録できない" do
    end
    it "passwordが空では登録できない" do
    end
    it "passwordが6文字以下では登録できない" do
    end
    it "passwordが半角英数字混合でないと登録できない" do
    end
    it "passwordとpassword_confiremationの値が一致していないと登録できない" do
    end
  end

  describe "ユーザー本人情報確認" do
    it "nicknameが空だと登録できない" do
    end
    it "emailが空では登録できない" do
    end
    it "emailが値が一意でないとは登録できない" do
    end
    it "emailが値が@を含んでないとは登録できない" do
    end
    it "passwordが空では登録できない" do
    end
    it "passwordが6文字以下では登録できない" do
    end
    it "passwordが半角英数字混合でないと登録できない" do
    end
    it "passwordとpassword_confiremationの値が一致していないと登録できない" do
    end
  end

end
