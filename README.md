# テーブル設計

## users テーブル

| Column                | Type     | Options                    |
| --------------------- | -------  | -------------------------- |
| nickname              | string   | null: false                |
| email                 | string   | null: false                |
| password_confirmation | string   | null: false                |
| first_name            | string   | null: false                |
| last_name             | string   | null: false                |
| birthday              | datetime | null: false                |

has_many: items
has_many: orders

## items テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| item_name          | string      | null: false                    |
| price              | integer     | null: false                    |
| description        | text        | null: false                    |
| condition          | integer     | null: false                    |
| category           | integer     | null: false                    |
| postage            | integer     | null: false                    |
| region             | integer     | null: false                    |
| shipping_date      | integer     | null: false                    |
| user               | references  | null: false, foreign_key: true |

belongs_to :user
has_one :orders 


## orders テーブル

| Column | Type       | Options                            |
| -------| ---------- | ---------------------------------- |
| user   | references | null: false, foreign_key           |
| item   | references | null: false, foreign_key           |

has_one :shipping_information


## shipping_information テーブル

| Column       | Type       | Options                  |
| ------------ | ---------- | ------------------------ |
| postal code  | string     | null: false              |
| region       | integer    | null: false              |
| city         | string     | null: false              |
| address No.  | string     | null: false              |
| building     | string     |                          |
| tel No.      | string     | null: false              |
| order        | references | null:false, foreign_key  |

belongs_to :order