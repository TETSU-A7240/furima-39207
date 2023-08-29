require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "ユーザー新規登録" do
    before do
      @item = FactoryBot.build(:item)
    end
    
    context '商品が出品できるとき' do
      it '全ての項目が正しく入力されている場合' do
        @item = FactoryBot.build(:item)
        expect(item).to be_valid
      end
    end

    context '商品が出品できないとき' do
      it "画像がないと登録できない" do
        @item.image = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Image name can't be blank"
      end
      it "商品名が空だと登録できない" do
        @item.item_name = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it "商品の説明が空だと登録できない" do
        @item.description = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it "カテゴリーが空だと登録できない" do
        @item.category_id = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Category Select"
      end
      it "商品の状態が空だと登録できない" do
        @item.condition_id = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition Select"
      end
      it "配送料の負担が空だと登録できない" do
        @item.postage_id = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Postage Select"
      end
      it "発送元の地域が空だと登録できない" do
        @item.region_id = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Region Select"
      end
      it "発送までの日数が空だと登録できない" do
        @item.shipping_date_id = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping date Select"
      end
      it "価格が空だと登録できない" do
        @item.price_id = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it "価格が¥300未満だと登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
  
      it "価格が¥9,999,999超過だと登録できない" do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
  
      it "価格が半角数値でないと登録できない" do
        @item.price = '１２３４５'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be a valid number"
      end

end
