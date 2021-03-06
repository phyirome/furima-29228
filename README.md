# README

# テーブル設計

## usersテーブル
| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | nill: false |
| password              | string | null: false |
| password_confirmation | stirng | null: false |
| family_name           | string | null: false |
| first_name            | string | null: false |
| kana_family_name      | string | null: false |
| kana_first_name       | string | null: false |
| birthday              | date   | null: false |


### Association
  has_many :items  
  has_many :purchases


## itemsモデル
| Column                | Type       | Options           |
| --------------------- | ---------- | ----------------- |
| name                  | string     | null: false       |
| price                 | integer    | null: false       |
| text                  | string     | null: false       |
| user                  | references | foreign_key: true |
| category_id (AH)      | integer    | null: false       |
| condition_id (AH)     | integer    | null: false       |
| shipping_fee_id (AH)  | integer    | null: false       |
| shipping_from_id (AH) | integer    | null: false       |
| shipping_day_id (AH)  | integer    | null: false       |

### Association
  belongs_to :user  
  has_one :purchase


## Purchases
| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| item   | references | foreign_key: true |
| user   | references | foreign_key: true |

### Association
  belongs_to :item  
  belongs_to :user  
  has_one: address


## Addresses
| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| postal_code        | string     | null: false       |
| prefecture_id (AH) | integer    | null: false       |
| city               | string     | null: false       |
| address            | string     | null: false       |
| building_name      | string     |                   |
| phone_number       | integer    | null: false       |
| purchase           | references | foreign_key: true |

### Association
  belongs_to :purchase
