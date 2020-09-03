# テーブル設計

## users テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| name           | string  | null: false |
| email          | string  | null: false |
| password       | string  | null: false |
|first-name      | string  | null: false |
|family-name     | string  | null: false |
|first-name-kana | string  | null: false |
|family-name-kana| string  | null: false |
| gender         | string  | null: false |
| birthday       | date    | null: false |

### Association

- has_many :comments
- has_many :orders
- has_many :items

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| image            | string     | null: false                    |
| text             | string     | null: false                    |
| category_id      | integer    | null: false                    |
| price            | integer    | null: false                    |
| status           | integer    | null:false                     |
| prefecture       | integer    | null: false                    |
| shipping-date_id | integer    | null:false                     |
| burden-shipping  | string     | null:false                     |


### Association

- belongs_to :user
- has_one :order

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
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- has_many:comments
- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | string     | null: false                    |
| postal-code   | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     | null: false                    |
| phone-number  | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association
- belongs_to :order
- belongs_to_active_hash :prefecture