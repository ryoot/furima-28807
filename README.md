# テーブル設計

## users テーブル

| Column       | Type    | Options     |
| ------------ | ------  | ----------- |
| name         | string  | null: false |
| email        | string  | null: false |
| password     | string  | null: false |
|first-name    | string  | null: false |
|family-name   | string  | null: false |
|birthday-year | integer | null: false |
|birthday-month| integer | null: false |

### Association

- has_many :comments
- has_many :orders
- has_many :items
- has_one :address
- has_one :creditcards

## items テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| image    | string | null: false |
| text     | string | null: false |
| category | string | null: false |

### Association

- has_many :users

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| order  | references | null: false, foreign_key: true |
| text   | string     | null: false                    |

### Association

- belongs_to :user

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| name    | string     |                                |
| user    | references | null: false, foreign_key: true |
| brand   | references | null: false, foreign_key: true |
| price   | integer    | null: false                    |
| status  | integer    | null:false                     |
| size    | string     | null:false                     |

### Association

- has_many:comments
- belongs_to :user

## credit_cards テーブル
| Column       | Type      | Options     |
| ------------ | ------    | ----------- |
| user         | reference | null: false |
| card_company | string    | null: false |
| card_number  | string    | null: false |
| card_year    | string    | null: false |
| card_month   | string    | null: false |
| card_password| integer   | null: false |
| customer_id  | integer   | null: false |

### Association

- belongs_to :user

## address テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| address      | string     | null: false                    |
| building     | string     | null: false                    |
| phone-number | integer    | null:false                     |
| prefecture   | string     | null:false                     |

### Association
- belongs_to :user
