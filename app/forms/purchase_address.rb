class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token

  validates :address, presence: {message:"が空欄です。"}

  validates :prefecture_id, numericality: { other_than: 0, message:"を選択してください。" }

  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message:"は無効です。半角数字とハイフンで入力してください。"}

  validates :phone_number, format: { with: /\A[0-9]+\z/, message:"は無効です。半角数字で入力してください。"}

  validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/,message:"は無効です。全角で入力してください。"}

  validates :postal_code, :phone_number, :city, presence: { message: 'が空欄です'}

  
  with_options presence: true do
    validates :token
    validates :item_id
    validates :user_id
  end

  def save
    pur = Purchase.create(user_id: user_id, item_id: item_id)
    # ↑.create(テーブルのカラム名1: フォームのname属性1, テーブルのカラム名2, フォームのname属性2 )
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, purchase_id: pur.id)
    # ↑ビューファイルの対応するformの、たとえばprefectureなら:prefecture_idというキーと同一にする。
  end

end