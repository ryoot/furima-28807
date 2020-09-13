require 'rails_helper'

RSpec.describe OrderItems, type: :model do
  describe OrderItems do
  before do
    user = FactoryBot.build(:user)
    item = FactoryBot.build(:item)
    @order = FactoryBot.build(:order_items, user_id:user.id, item_id:item.id)
  end
    it "全て入力されていればOK" do
      expect(@order).to be_valid
    end

    it "postが空ならNG" do
      @order.post = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("Post is invalid. Include hyphen(-)")
    end
    
    it "postが意図しない形ならNG（ハイフンなし）" do
      @order.post = "1111111"
      @order.valid?
      expect(@order.errors.full_messages).to include("Post is invalid. Include hyphen(-)")
    end
    it "prefecture_idが空ならNG" do
      @order.prefecture_id = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "cityが空ならNG" do
      @order.city = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end
    it "addressが空ならNG" do
      @order.address = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end
    it "buildingは空でも保存できること" do
      @order.building = nil
      expect(@order).to be_valid
    end
    it "phone_numberが空ならNG" do
      @order.phone_number = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end
    it "tokenが空ならNG" do
      @order.token = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
  end
end
