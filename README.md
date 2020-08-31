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
has_many :comments


## itemsモデル
| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| title   | string  | null: false                    |
| image   | string  | null: false                    |
| price   | integer | null :false                    |
| user_id | integer | null: false, foreign_key: true |

### Association
belongs_to :users
has_many :comments
has_one :customer


## Comments
| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| text    | string  | null: false                    |
| item_id | string  | null: false, foreign_key:true  |
| user_id | integer | null: false, foreign_key: true |

### Association
belongs_to :users
belongs_to :items


## Customers
| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| item_id | integer | null: false, foreign_key: true |

### Association
belongs_to :items
has_one: addresses


## Addresses
| Column      | Type    | Options                        |
| ----------- | ------- | ------------------------------ |
| address     | string  | null: false                    |
| customer_id | integer | null: false, foreign_key: true |

### Association
belongs_to :customers