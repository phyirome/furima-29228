class Address < ApplicationRecord
  belongs_to :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :postal_code, :string, :address, :phone_number, presence: true

  validates :prefecture_id, numericality: { other_than: 0 }
  
end
