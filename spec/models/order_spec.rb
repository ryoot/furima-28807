require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:item)
    it "全て入力されていればOK" do
      expect(@order).to be_valid
    end
    it "card_numberが空ならNG" do
      @order.card_number = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("を入力してください")
    end
    it "card_numberがinteger以外ならNG" do
      @order.card_number = "4242424242424242"
      @order.valid?
      expect(@order.errors.full_messages).to include("は数値で入力してください")
    end
    it "card_companyが空ならNG" do
      @order.card_company = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("を入力してください")
    end
    it "card_yearが空ならNG" do
      @order.card_year = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("を入力してください")
    end
    it "card_monthが空ならNG" do
      @order.card_month = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("を入力してください")
    end
    it "card_cvcが空ならNG" do
      @order.card_cvc = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("を入力してください")
    end
    
    it "card_cvcがinteger以外ならNG" do
      @order.card_cvc = "111"
      @order.valid?
      expect(product.errors[:card_pass]).to include("は数値で入力してください")
    end
  end
end
