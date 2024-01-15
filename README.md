# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickame            | string | null: false |
| email              | string | null: false,unique:true|
| encrypted_password | string | null: false |
| name_first         | string | null: false |
| name_secound       | string | null: false |
| name_first_kana    | string | null: false |
| name_secound_kana  | string | null: false |
| birthday_year      | date   | null: false |
| birthday_month     | date   | null: false |
| birthday_day       | date   | null: false |

### Association

- has_many :merchandises
- has_one :purchase
- has_many :comments

## merchandise テーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| name            | string     | null: false                   |
| explanation     | text       | null: false                   |
| category_id     | integer    | null: false                   |
| condition_id    | integer    | null: false                   |
| shipping_load_id| integer    | null: false                   |
| shipping_area_id| integer    | null: false                   |
| shipping_day_id | integer    | null: false                   |
| price           | integer    | null: false                   |
| user            | references | null: false,foreign_key: true |


### Association

- belongs_to :user
- has_one :purchase
- has_many :comments

## address テーブル

| Column              | Type       | Options                       |
| ------------------- | ---------- | ----------------------------- |
| post_number         | string     | null: false                   |
| post_prefecture_id  | integer    | null: false                   |
| post_city           | string     | null: false                   |
| post_address        | string     | null: false                   |
| post_building       | string     |                               |
| telephone_number    | string     | null: false                   |
| purchase            | references | null: false,foreign_key: true |



### Association

- belongs_to :purchase

## purchase テーブル

| Column           | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| user             | references | null: false,foreign_key: true |
| merchandise      | references | null: false,foreign_key: true |


### Association

- has_one :address
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