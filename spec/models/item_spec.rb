require 'rails_helper'

RSpec.describe Item, type: :model do
  describe Item do
    before do
      @item = FactoryBot.build(:item)
    end
      it "全て入力されていれば登録できる" do
        expect(@item).to be_valid
      end
      it "nameが空なら登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "textが空なら登録できない" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "category_idが空なら登録できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "statusが空なら登録できない" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "burden_shipping_idが空なら登録できない" do
        @item.burden_shipping_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden shipping can't be blank")
      end
      it "prefecture_idが空なら登録できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "shipping_date_idが空なら登録できない" do
        @item.shipping_date_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end
      it "priceが空なら登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceがinteger以外なら登録できない" do
        item = FactoryBot.build(:item, price: "３００")
        item.valid?
        expect(item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが300円未満なら登録できない" do
        item = FactoryBot.build(:item, price: "290")
        item.valid?
        expect(item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが9999999円よりも高額なら登録できない" do
        item = FactoryBot.build(:item, price: "19999999")
        item.valid?
        expect(item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
