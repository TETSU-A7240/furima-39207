require 'rails_helper'

RSpec.describe Item, type: :model do

  describe "商品新規登録" do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品が出品できるとき' do
      it '全ての項目が正しく入力されている場合' do
       # @item = FactoryBot.create(:item)
        expect(@item).to be_valid
      end
    end


    context '商品が出品できないとき' do
      it "画像がないと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
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
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it "商品の状態が空だと登録できない" do
        @item.condition_id = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it "配送料の負担が空だと登録できない" do
        @item.postage_id = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Postage can't be blank"
      end
      it "発送元の地域が空だと登録できない" do
        @item.region_id = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Region can't be blank"
      end
      it "発送までの日数が空だと登録できない" do
        @item.shipping_date_id = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping date can't be blank"
      end
      it "価格が空だと登録できない" do
        @item.price = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be between ¥300 and ¥9,999,999", "Price must be a valid number"
      end
      it "価格が¥300未満だと登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be between ¥300 and ¥9,999,999"
      end
  
      it "価格が¥9,999,999超過だと登録できない" do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be between ¥300 and ¥9,999,999"
      end
  
      it "価格が半角数値でないと登録できない" do
        @item.price = '１２３４５'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be between ¥300 and ¥9,999,999"
      end

      it 'カテゴリーが「---」の場合は出品できない' do
        @item.category_id = 1
        expect(@item).not_to be_valid
      end
      
      it '商品の状態が「---」の場合は出品できない' do
        @item.condition_id = 1
        expect(@item).not_to be_valid
      end
      
      it '配送料の負担が「---」の場合は出品できない' do
        @item.postage_id = 1
        expect(@item).not_to be_valid
      end
      
      it '発送元の地域が「---」の場合は出品できない' do
        @item.region_id = 1
        expect(@item).not_to be_valid
      end
      
      it '発送までの日数が「---」の場合は出品できない' do
        @item.shipping_date_id = 1
        expect(@item).not_to be_valid
      end
      
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        expect(@item).not_to be_valid
      end
    end
  end
end

