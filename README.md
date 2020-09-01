# README

## usersテーブル
| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | nill: false |
| password              | string | null: false |
| password_confirmation | stirng | null: false |

### Association
has_many :items
has_many :customers


## itemsモデル
| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| title   | string  | null: false                    |
| image   | string  | null: false                    |
| price   | integer | null :false                    |
| user_id | integer | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :customer


## Customers
| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| item_id | integer | null: false, foreign_key: true |
| user_id | integer | null: false, foreign_key: true |

### Association
belongs_to :item
has_one: address


## Addresses
| Column      | Type    | Options                        |
| ----------- | ------- | ------------------------------ |
| address     | string  | null: false                    |
| customer_id | integer | null: false, foreign_key: true |

### Association
belongs_to :customer
