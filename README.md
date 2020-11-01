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
| birth_day        | date     | null: false |

### Association

- has_many  :items
- has_many  :orders

## items テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| name               | string     | null: false                     |
| introduction       | text       | null: false                     |
| category_id        | integer    | null: false                     |
| condition_id       | integer    | null: false                     |
| price              | integer    | null: false                     |
| delivery_area_id   | integer    | null: false                     |
| delivery_burden_id | integer    | null: false                     |
| delivery_day_id    | integer    | null: false                     |
| user               | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column          | Type       | Options                         |
| --------------- | ---------- | ------------------------------- |
| post_code       | string     | null: false                     |
| prefectures_id  | integer    | null: false                     |
| city            | string     | null: false                     |
| house_number    | string     | null: false                     |
| building_number | string     |                                 |
| phone_number    | string     |                                 |
| order           | references | null: false, foreign_key: true  |

 ### Association

- belongs_to :order