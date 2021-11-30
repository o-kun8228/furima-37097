require 'rails_helper'

RSpec.describe LogAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    
    @log_address = FactoryBot.build(:log_address, user_id: user.id, item_id: item.id)
    sleep 0.1

  end

  describe '配達先の情報の保存' do

    context '配送先の情報の保存ができるとき' do

      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@log_address).to be_valid
      end

      
      it '郵便番号が3ハイフン4桁で半角文字列の組み合わせならば保存できる' do
        @log_address.postal_code = '123-4567'
        expect(@log_address).to be_valid
      end

      it '都道府県が「---」以外かつ空でなければ保存できる' do
        @log_address.shipping_area_id = 3
        expect(@log_address).to be_valid
      end

      it '市区町村名が空でなければ保存できる' do
        @log_address.city = "空市"
        expect(@log_address).to be_valid
      end

      it '番地が空でなければ保存できる' do
        @log_address.address = '雲234'
        expect(@log_address).to be_valid
      end

      it '建物名は空でも保存できる' do
        @log_address.building_name = nil
        expect(@log_address).to be_valid
      end

      it '電話番号が10桁以上11桁以内の半角数値のみであれば保存できる' do
        @log_address.phone_number = 12345678901
        expect(@log_address).to be_valid
      end
    end

    context '配送先の情報の保存ができないとき' do

      it '郵便番号が空だと保存できないこと' do
        @log_address.postal_code = nil
        @log_address.valid?
        expect(@log_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号にハイフンがないと保存できないこと' do
        @log_address.postal_code = 1_234_567
        @log_address.valid?
        expect(@log_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it '都道府県が「---」だと保存できないこと' do
        @log_address.shipping_area_id = 0
        @log_address.valid?
        expect(@log_address.errors.full_messages).to include("Shipping area can't be blank")
      end

      it '都道府県が空だと保存できないこと' do
        @log_address.shipping_area_id = nil
        @log_address.valid?
        expect(@log_address.errors.full_messages).to include("Shipping area can't be blank")
      end

      it '市区町村が空だと保存できないこと' do
        @log_address.city = nil
        @log_address.valid?
        expect(@log_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと保存できないこと' do
        @log_address.address = nil
        @log_address.valid?
        expect(@log_address.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空だと保存できないこと' do
        @log_address.phone_number = nil
        @log_address.valid?
        expect(@log_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号にハイフンがあると保存できないこと' do
        @log_address.phone_number = '123 - 1234 - 1234'
        @log_address.valid?
        expect(@log_address.errors.full_messages).to include("Phone number is invalid. Include hyphen(-) cant over 12")
      end

      it '電話番号が12桁以上あると保存できないこと' do
        @log_address.phone_number = "1234567890123"
        @log_address.valid?
        expect(@log_address.errors.full_messages).to include('Phone number is invalid. Include hyphen(-) cant over 12')
      end
      it 'トークンが空だと保存できないこと' do
        @log_address.token = nil
        @log_address.valid?
        expect(@log_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'userが紐付いていない場合登録できない' do
        @log_address.user_id = nil
        @log_address.valid?
        expect(@log_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていない場合登録できない' do
        @log_address.item_id = nil
        @log_address.valid?
        expect(@log_address.errors.full_messages).to include("Item can't be blank")
      end


    end
  end
end
