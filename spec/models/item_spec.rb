require 'rails_helper'

RSpec.describe Item, type: :model do
  describe Item do
    describe '#create' do
      it "全て入力されていれば登録できる" do
        item = FactoryBot.create(:item)
        expect(item).to be_valid
      end
      it "nameが空なら登録できない" do
        item = FactoryBot.build(:item, name: nil)
        item.valid?
        expect(item.errors.full_messages).to include("を入力してください")
      end
      it "textが空なら登録できない" do
        item = FactoryBot.build(:item, text: nil)
        item.valid?
        expect(item.errors.full_messages).to include("を入力してください")
      end
      it "priceが空なら登録できない" do
        item = FactoryBot.build(:item, price: nil)
        item.valid?
        expect(item.errors.full_messages).to include("を入力してください")
      end
      it "priceがinteger以外なら登録できない" do
        item = FactoryBot.build(:item, price: "３００")
        item.valid?
        expect(item.errors.full_messages).to include("は数値で入力してください")
      end
      it "priceが300円未満なら登録できない" do
        item = FactoryBot.build(:item, price: "290")
        item.valid?
        expect(item.errors.full_messages).to include("は300以上の値にしてください")
      end
      it "priceが9999999円よりも高額なら登録できない" do
        item = FactoryBot.build(:item, price: "19999999")
        item.valid?
        expect(item.errors.full_messages).to include("は9999999以下の値にしてください")
      end
    end
  end
