require 'rails_helper'

RSpec.describe BuyAdd, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buy_add = FactoryBot.build(:buy_add, item_id: item.id, user_id: user.id)
      # エラーが多発するためsleepメソッドを入れた
      sleep(0.1)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy_add).to be_valid
      end
      it '発送先の地域の情報(building)は空でも保存できること' do
        @buy_add.building = ''
        expect(@buy_add).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号(post_number)が空だと保存できない' do
        @buy_add.post_number = ''
        @buy_add.valid?
        expect(@buy_add.errors.full_messages).to include "Post number can't be blank"
      end
      it '郵便番号(post_number)が半角のハイフンを含んだ正しい形式でないと保存できない' do
        @buy_add.post_number = '1234567'
        @buy_add.valid?
        expect(@buy_add.errors.full_messages).to include "Post number is invalid. Include hyphen(-)"
      end
      it '発送先の地域の情報(prefecture_id)が空(1)では保存できない' do
        @buy_add.prefecture_id = '1'
        @buy_add.valid?
        expect(@buy_add.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '発送先の地域の情報(municipalities)が空では保存できない' do
        @buy_add.municipalities = ''
        @buy_add.valid?
        expect(@buy_add.errors.full_messages).to include "Municipalities can't be blank"
      end
      it '発送先の地域の情報(address)が空では保存できない' do
        @buy_add.address = ''
        @buy_add.valid?
        expect(@buy_add.errors.full_messages).to include "Address can't be blank"
      end
      it '発送先の地域の情報(address)が空では保存できない' do
        @buy_add.address = ''
        @buy_add.valid?
        expect(@buy_add.errors.full_messages).to include "Address can't be blank"
      end
      it '電話番号(phone_number)が空だと保存できない' do
        @buy_add.phone_number = ''
        @buy_add.valid?
        expect(@buy_add.errors.full_messages).to include "Phone number can't be blank"
      end
      it '電話番号(phone_number)が半角のハイフンを除いた正しい形式でないと保存できない' do
        @buy_add.phone_number = '090-1234-5678'
        @buy_add.valid?
        expect(@buy_add.errors.full_messages).to include "Phone number is invalid. Not include hyphen(-)"
      end
      it 'userが紐付いていないと保存できない' do
        @buy_add.user_id = nil
        @buy_add.valid?
        expect(@buy_add.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できない' do
        @buy_add.item_id = nil
        @buy_add.valid?
        expect(@buy_add.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end