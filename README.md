# README

## usersテーブル
| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | nill: false |
| password              | string | null: false |
| password_confirmation | stirng | null: false |
| name                  | string | null:false  |
| kana_name             | string | null:false  |

### Association
has_many :items
has_many :purchases


## itemsモデル
| Column    | Type    | Options                        |
| --------- | ------- | ------------------------------ |
| item_name | string  | null: false                    |
| image     | string  | null: false                    |
| price     | integer | null :false                    |
| text      | string  | null:false                     |
| user_id   | integer | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :purchase


## Purchases
| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| item_id | integer | null: false, foreign_key: true |
| user_id | integer | null: false, foreign_key: true |

### Association
belongs_to :item
has_one: address


## Addresses
| Column       | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| postal_code  | string  | null:false                     |
| address      | string  | null: false                    |
| customer_id  | integer | null: false, foreign_key: true |
| phone_number | integer | null:false                     |


### Association
belongs_to :purchase
