class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :condition, :shipping_day, :shipping_fee, :shipping_from

  validates :category, :condition, :shipping_day, :shipping_fee, :shipping_from, presence: true

  validates :name, :price, :text, :category_id, :condition_id, :shipping_day_id, :shipping_fee_id, :shipping_from_id, numericality: { other_than: 0 }
  
end
