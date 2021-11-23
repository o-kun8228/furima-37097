require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品情報がデータベースに保存される' do
      it '下記条件が全て是の時保存される' do
        expect(@item).to be_valid
      end
    end
    context '商品情報がデータベースに保存できない場合' do
      it '商品画像を1枚つけることが必須' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では登録できない' do
        @item.brand_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Brand name can't be blank")
      end
      it '商品の説明が必須である' do
        @item.description_item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description item can't be blank")
      end

      it 'カテゴリーの情報が必須' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態の情報が必須' do
        @item.status = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it '配送料の負担の情報が必須' do
        @item.fee = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end

      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end

      it '発送元の地域の情報が必須' do
        @item.shipping_area = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end

      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end

      it '発送までの日数が必須' do
        @item.send_day = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Send day can't be blank")
      end

      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.send_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Send day can't be blank")
      end

      it '価格の情報が必須' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格は、¥299以下だと保存ができない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '価格は、¥10000000以上だと保存ができない' do
        @item.price = 10_000_001
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 999999')
      end

      it '価格は半角数値のみ保存可能であること' do
        @item.price = 'a'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
