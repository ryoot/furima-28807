class Item < ApplicationRecord
 extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden_shipping
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date

  validates :image, presence: true

  validates :name, :text, presence: true
  
  validates :price,presence: true,numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  
  validates :category_id, presence: true
  
  validates :status_id, presence: true
  
  validates :burden_shipping_id, presence: true
  
  validates :prefecture_id, presence: true
  
  validates :shipping_date_id, presence: true
  
  belongs_to :user
  has_one_attached :image
  has_one :order

end
