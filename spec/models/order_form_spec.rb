require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '商品購入記録の保存' do
    before do
       @user = FactoryBot.create(:user)
       @item = FactoryBot.create(:item, user: @user)
       @order_form = FactoryBot.build(:order_form, user_id: @user.id, item_id: @item.id)
    end

    context '商品が購入できるとき' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@order_form).to be_valid
      end
      it '建物名が空でも購入できること' do
        @order_form.building = ''
        expect(@order_form).to be_valid
      end
    end
    context '商品が購入できないとき' do
      it '郵便番号は空では保存できないこと' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は『３桁ハイフン４桁』半角英数字でないと保存できないこと' do
        @order_form.postal_code = '123-123４'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県に「---」が選択されている場合は購入できないこと' do
        @order_form.region_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Region can't be blank")
      end
      it '市区町村が空だと購入できないこと' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと購入できないこと' do
        @order_form.address_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address number can't be blank")
      end
      it '電話番号が空だと購入できないこと' do
        @order_form.tel_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Tel number can't be blank")
      end
      it '電話番号が9桁以下だと購入できないこと' do
        @order_form.tel_number = '090123456'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Tel number is invalid. Include hyphen(-)")
      end
      it '電話番号が12桁以上だと購入できない' do
        @order_form.tel_number = '090123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Tel number is invalid. Include hyphen(-)")
      end
      it '電話番号が半角数値でないと購入できないこと' do
        @order_form.tel_number = '０9012341234'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Tel number is invalid. Include hyphen(-)")
      end
      it "tokenが空では登録できないこと" do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
