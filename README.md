# テーブル設計

## users テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| name           | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
|first-name      | string | null: false |
|family-name     | string | null: false |
|first-name-kana | string | null: false |
|family-name-kana| string | null: false |
| gender         | string | null: false |

### Association

- has_many :comments
- has_many :orders
- has_many :items
- has_one :address

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| image         | string     | null: false                    |
| text          | string     | null: false                    |
| category      | string     | null: false                    |
| brand         | references | null: false, foreign_key: true |
| price         | integer    | null: false                    |
| status        | integer    | null:false                     |
| size          | string     | null:false                     |
| shipping-date | string     | null:false                     |


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
| user_id | references | null: false, foreign_key: true |

### Association

- has_many:comments
- belongs_to :user

## deta テーブル
| Column         | Type      | Options     |
| -------------  | ------    | ----------- |
| user           | reference | null: false |
| birthday-year  | string    | null: false |
| birthday-month | string    | null: false |
| birthday-day   | string    | null: false |

### Association

- belongs_to :user

## address テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| address_id    | integer    | null: false                    |
| building_id   | integer    | null: false                    |
| phone-number  | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association
- belongs_to :order
- belongs_to_active_hash :prefecture