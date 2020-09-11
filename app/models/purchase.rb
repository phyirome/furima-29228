class Purchase < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :address
  # has_one: address
  validates :user_id, presence:true
  validates :item_id, presence:true

  attr_accessor :token
  validates :token, presence:true

end
