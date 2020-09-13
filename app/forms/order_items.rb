class OrderItems
  include ActiveModel::Model
  attr_accessor :post, :prefecture_id, :city, :address, :building,:phone_number, :token, :user_id, :item_id

  validates :post, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, presence:true
  validates :city, presence:true
  validates :address, presence:true
  validates :phone_number, presence: true
  validates :token, presence:true

  def save
   order = Order.create( user_id: user_id, item_id: item_id)
    Address.create!(post: post, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end

end