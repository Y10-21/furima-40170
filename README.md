# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickame            | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name_first         | string | null: false |
| name_secound       | string | null: false |
| name_first_kana    | string | null: false |
| name_secound_kana  | string | null: false |
| birthday_year      | data   | null: false |
| birthday_month     | data   | null: false |
| birthday_day       | data   | null: false |

### Association

- has_many :merchandises
- has_many :purchases
- has_many :comments

## merchandise テーブル

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| name         | string     | null: false                   |
| explanation  | text       | null: false                   |
| category     | string     | null: false                   |
| condition    | string     | null: false                   |
| shipping_load| string     | null: false                   |
| shipping_area| string     | null: false                   |
| shipping_day | string     | null: false                   |
| price        | integer    | null: false                   |
| user         | references | null: false,foreign_key: true |


### Association

- belongs_to :user
- belongs_to :purchase
- has_many :comments

## purchase テーブル

| Column           | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| card_number      | integer    | null: false                   |
| card_period      | data       | null: false                   |
| card_cord        | integer    | null: false                   |
| post_number      | integer    | null: false                   |
| post_address     | string     | null: false                   |
| post_building    | string     | null: false                   |
| telephone_number | string     | null: false                   |
| user             | references | null: false,foreign_key: true |
| merchandise      | references | null: false,foreign_key: true |


### Association

- belongs_to :user
- belongs_to :merchandises

## comments テーブル

| Column     | Type       | Options                       |
| ---------- | ---------- | ----------------------------- |
| content    | text       | null: false                   |
| merchandise| references | null: false,foreign_key: true |
| user       | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :merchandises