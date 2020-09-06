class Item < ApplicationRecord
 extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden_shipping
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date

  validates :text, :category_id, presence: true
  validates :category_id,  numericality: { other_than: 0 }

  validates :text, :status_id, presence: true
  validates :status_id,  numericality: { other_than: 0 }

  validates :text, :burden_shipping_id, presence: true
  validates :burden_shipping_id,  numericality: { other_than: 0 }

  validates :text, :prefecture_id, presence: true
  validates :prefecture_id,  numericality: { other_than: 0 }

  validates :text, :shipping_date_id, presence: true
  validates :shipping_date_id,  numericality: { other_than: 0 }



  belongs_to :user
  has_one_attached :image

end
