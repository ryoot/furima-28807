class Item < ApplicationRecord
 extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden_shipping
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date

  validates :title, :text, :category_id, presence: true
  validates :category_id,  numericality: { other_than: 1 }

  validates :title, :text, :status, presence: true
  validates :status_id,  numericality: { other_than: 1 }

  validates :title, :text, :burden_shipping, presence: true
  validates :burden_shipping_id,  numericality: { other_than: 1 }

  validates :title, :text, :prefecture, presence: true
  validates :prefecture_id,  numericality: { other_than: 1 }

  validates :title, :text, :shipping_date, presence: true
  validates :shipping_date_id,  numericality: { other_than: 1 }



  belongs_to :user
  has_one_attached :image

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
