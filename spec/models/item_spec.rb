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
        @item.price = 9_999_999
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
      it 'カテゴリー(category_id)が空(1)では保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '商品の状態の情報(status_id)が空で(1)は保存できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it '配送料の負担の情報(postage_id)が空(1)では保存できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Postage can't be blank"
      end
      it '発送元の地域の情報(prefecture_id)が空(1)では保存できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '発送までの日数の情報(take_days_id)が空(1)では保存できない' do
        @item.take_days_id = 1
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
        expect(@item.errors.full_messages).to include 'Price は、半角数字で¥300~¥9,999,999の間で入力して下さい'
      end
      it '価格(price)が¥9,999,999を超えると保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price は、半角数字で¥300~¥9,999,999の間で入力して下さい'
      end
      it '価格(price)が全角入力だと保存できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price は、半角数字で¥300~¥9,999,999の間で入力して下さい'
      end
      it 'userが紐づいていないと保存できない。' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
