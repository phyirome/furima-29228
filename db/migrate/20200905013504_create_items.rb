class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.string :text, null: false
      t.integer :user_id, foreign_key: true
      t.integer :category_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :shipping_fee_id, null: false
      t.integer :shipping_from_id, null: false
      t.integer :shippng_days_id, null: false
      t.timestamps
    end
  end
end
