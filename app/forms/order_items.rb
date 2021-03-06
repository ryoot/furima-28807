class OrderItems
  include ActiveModel::Model
  attr_accessor :post, :prefecture_id, :city, :address, :building,:phone_number, :token, :user_id, :item_id

  with_options presence: true do
  validates :post, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id
  validates :city
  validates :address
  validates :phone_number, format: {with: /\A\d{11}\z/}
  validates :token
  end
  
  def save
   order = Order.create( user_id: user_id, item_id: item_id)
    Address.create!(post: post, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end

end