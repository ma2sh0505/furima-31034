#テーブル設計

## users テーブル

| Column           | Type     | Options     |
| ---------------- | -------- | ----------- |
| email            | string   | null: false |
| password         | string   | null: false |
| nickname         | string   | null: false |
| family_name      | string   | null: false |
| first_name       | string   | null: false |
| family_name_kana | string   | null: false |
| first_name_kana  | string   | null: false |
| birth_year       | date     | null: false |
| birth_month      | date     | null: false |
| birth_day        | date     | null: false |

### Association

- has_many  :items
- has_many  :orders

## items テーブル

| Column          | Type       | Options                         |
| --------------- | ---------- | ------------------------------- |
| item_name       | string     | null: false                     |
| introduction    | text       | null: false                     |
| category        | string     | null: false                     |
| item_condition  | string     | null: false                     |
| price           | integer    | null: false                     |
| delivery_area   | string     | null: false                     |
| delivery_burden | string     | null: false                     |
| delivery_day    | string     | null: false                     |
| user            | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card-number      | integer    | null: false                    |
| expiration_year  | integer    | null: false                    |
| expiration_month | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| prefectures     | string     | null: false                    |
| city            | string     | null: false                    |
| house_number    | string     | null: false                    |
| building_number | string     | null: false                    |
| phone_number    | string     | null: false                    |
| item             | references | null: false, foreign_key: true |

 ### Association

- belongs_to : order