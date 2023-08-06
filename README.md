# テーブル設計

## users テーブル

| Column                | Type     | Options                    |
| --------------------- | -------  | -------------------------- |
| nickname              | string   | null: false                |
| email                 | string   | null: false, unique: true  |
| encrypted_password    | string   | null: false                |
| first_name            | string   | null: false                |
| last_name             | string   | null: false                |
| first_name_kana       | string   | null: false                |
| last_name_kana        | string   | null: false                |
| birthday              | date     | null: false                |

has_many: items
has_many: orders

## items テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| item_name          | string      | null: false                    |
| price              | integer     | null: false                    |
| description        | text        | null: false                    |
| condition_id       | integer     | null: false                    |
| category_id        | integer     | null: false                    |
| postage_id         | integer     | null: false                    |
| region_id          | integer     | null: false                    |
| shipping_date_id   | integer     | null: false                    |
| user               | references  | null: false, foreign_key: true |

belongs_to :user
has_one :order 


## orders テーブル

| Column | Type       | Options                            |
| -------| ---------- | ---------------------------------- |
| user   | references | null: false, foreign_key           |
| item   | references | null: false, foreign_key           |

has_one :shipping_information
belongs_to :user
belongs_to :item


## shipping_informations テーブル

| Column         | Type       | Options                  |
| -------------- | ---------- | ------------------------ |
| postal_code    | string     | null: false              |
| region_id      | integer    | null: false              |
| city           | string     | null: false              |
| address_number | string     | null: false              |
| building       | string     |                          |
| tel_number     | string     | null: false              |
| order          | references | null:false, foreign_key  |

belongs_to :order