require 'rails_helper'

RSpec.describe PurchaseRecordShippingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_record_shipping_address = FactoryBot.build(:purchase_record_shipping_address, user_id: user.id, item_id: item.id)
    sleep(3)
  end

  describe '商品購入機能' do
    context '商品購入ができるとき' do
      it 'postal_code,area_id,city,street,phone,item_id,user_id,token,が存在すれば購入できる' do
        expect(@purchase_record_shipping_address).to be_valid
      end
    end
    context '商品購入ができないとき' do
      it 'postal_codeが空では登録できない' do
        @purchase_record_shipping_address.postal_code = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが「3桁ハイフン4桁」の半角文字列でなければ登録できない' do
        @purchase_record_shipping_address.postal_code = 'aaa'
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'area_idが空では登録できない' do
        @purchase_record_shipping_address.area_id = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Area can't be blank")
      end
      it 'area_idは、1が選択されていると登録できない' do
        @purchase_record_shipping_address.area_id = 1
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Area can't be blank")
      end
      it 'cityが空では登録できない' do
        @purchase_record_shipping_address.city = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("City can't be blank")
      end
      it 'streetが空では登録できない' do
        @purchase_record_shipping_address.street = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Street can't be blank")
      end
      it 'phoneが空では登録できない' do
        @purchase_record_shipping_address.phone = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが10桁以上11桁以内の半角数値でなければ登録できない' do
        @purchase_record_shipping_address.phone = 'aaa'
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include('Phone is invalid')
      end
      it 'item_idが空では登録できない' do
        @purchase_record_shipping_address.item_id = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが空では登録できない' do
        @purchase_record_shipping_address.user_id = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'tokenが空では登録できない' do
        @purchase_record_shipping_address.token = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
