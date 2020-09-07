require 'rails_helper'

RSpec.describe Item, type: :model do
  describe Item do
      it "全て入力されていれば登録できる" do
        item = FactoryBot.build(:item)
        expect(item).to be_valid
      end
      it "nameが空なら登録できない" do
        item = FactoryBot.build(:item, name: nil)
        item.valid?
        expect(item.errors.full_messages).to include("Name can't be blank")
      end
      it "textが空なら登録できない" do
        item = FactoryBot.build(:item, text: nil)
        item.valid?
        expect(item.errors.full_messages).to include("Text can't be blank")
      end
      it "priceが空なら登録できない" do
        item = FactoryBot.build(:item, price: nil)
        item.valid?
        expect(item.errors.full_messages).to include("Price can't be blank")
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
