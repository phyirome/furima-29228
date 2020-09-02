# README

## usersテーブル
| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | nill: false |
| password              | string | null: false |
| password_confirmation | stirng | null: false |
| family_name           | string | null:false  |
| first_name            | string | null:false  |
| kana_family_name      | string | null:false  |
| kana_first_name       | string | null:false  |
| birth_year_id         | string | null:false  |
| birth_month_id        | string | null:false  |
| birth_day_id          | string | null:false  |

### Association
has_many :items
has_many :purchases


## itemsモデル
| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| item_name     | string  | null: false                    |
| image         | string  | null: false                    |
| price         | integer | null :false                    |
| text          | string  | null:false                     |
| user_id       | integer | null: false, foreign_key: true |
| category_id   | integer | null: false                    |
| prefecture_id | integer | null: false                    |
| shipping_fee  | integer | null: false                    |
| shipping_from | integer | null: false                    |
| shipping_days | integer | null: false                    |

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
belongs_to :user
has_one: address


## Addresses
| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | string  | null:false  |
| address       | string  | null: false |
| building_name | string  |             |
| phone_number  | integer | null:false  |
| prefecture_id | integer | null: false |

### Association
belongs_to :purchase
