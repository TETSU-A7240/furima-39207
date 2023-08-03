# テーブル設計

## user 　テーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| nickname           | string | null: false, unique: true  |
| email              | string | null: false                |
| password           | string | null: false                |

has_many: items
has_many: orders

## items テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| item name          | string      | null: false                    |
| price              | integer     | null: false                    |
| description        | text        | null: false                    |
| condition          | string      | null: false                    |
| category           | string      | null: false                    |
| seller             | string      | null: false                    |
| user_id            | references  | null: false, foreign_key: true |

belongs_to :users
has_one :orders 


## orders テーブル

| Column             | Type       | Options                            |
| ------------------ | ---------- | ---------------------------------- |
| buyer              | string     | null: false                        |
| item               | string     | null: false                        |
| user_id            | references | null: false, foreign_key: true     |
| item_id            | string     | null: false, foreign_key: true     |

has_many : shipping information


## shipping information テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postal code        | string | null: false |
| region             | string | null: false |
| city               | string | null: false |
| addres No.         | string | null: false |
| building           | string | null: false |
| tel No.            | string | null: false |
| name               | string | null:false  |