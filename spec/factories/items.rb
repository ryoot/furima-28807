FactoryBot.define do
  factory :item do
        name                    {"テスト"}
        text                 {"未使用のテストです"}
        category_id             {"1"}
        status_id               {"2"}
        burden_shipping_id      {"2"}
        prefecture_id           {"2"}
        shipping_date_id        {"1"}
        price                   {"300"}
        association :user
        
      end
  end

