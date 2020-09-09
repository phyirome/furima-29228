class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_from

  validates :name, :price, :text, presence: { message: 'が空欄です' }

  validates :category_id, :condition_id, :shipping_day_id, :shipping_fee_id, :shipping_from_id, presence: true, numericality: { other_than: 0, message: 'を選択してください' }

  validates :price, numericality: { message: 'は半角数字で入力してください' }

  validates :price, numericality: { greater_than_or_equal_to: 300, message: 'は300円以上に設定してください' }

  validates :price, numericality: { less_than_or_equal_to: 9_999_999, message: 'は9,999,999円以下に設定してください' }
end
