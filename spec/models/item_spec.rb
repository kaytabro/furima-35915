require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品(item)の出品' do
    context '商品(item)の出品ができる場合' do
      it 'すべての値が存在していれば保存できる' do
        expect(@item).to be_valid
      end
      it '価格(price)が¥300以上であれば保存できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it '価格(price)が¥9,999,999以以下であれば保存できる' do
        @item.price = 9999999
        expect(@item).to be_valid
      end
    end
    context '商品(item)の出品ができない場合' do
      it '画像(image)が空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名(name)が空では保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it '商品の説明(explain)が空では保存できない' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explain can't be blank"
      end
      it 'カテゴリー(category_id)が空では保存できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '商品の状態の情報(status_id)が空では保存できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it '発送元の地域の情報(postage_id)が空では保存できない' do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Postage can't be blank"
      end
      it '発送元の地域の情報(take_days_id)が空では保存できない' do
        @item.take_days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Take days can't be blank"
      end
      it '価格(price)が空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '価格(price)が¥300未満では保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it '価格(price)が¥9,999,999を超えると保存できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
      it '価格(price)が全角入力だと保存できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price は、半角数字で入力して下さい"
      end
    end
  end
end
