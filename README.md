# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| user     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| first_name   | string | null: false |
| family_name    | string | null: false |
| first_name_kana   | string | null: false |
| family_name_kana   | string | null: false |
| birthday   | data | null: false |
| user_id  | string | null: false |

### Association

- has_many :products
- has_many :comments
- has_one :credit_card
- has_one :profile

## products テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| name         | string | null: false |
| price        | integer | null: false |
| category     | string | null: false |
| bland        | string | null: false |
| introduction | text | null: false |
| condition    | integer | null: false |
| postage      | integer | null: false |
| shipping_area| integer | null: false |
| preparation_day | integer | null: false |

### Association

- has_many :comments
- has_many :product_image
- belongs_to :category
- belongs_to :user

## comments テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| comment   | string | null: false |
| user    | string | null: false |
| item    | string | null: false |

### Association

- belongs_to :user
- belongs_to :product

## product_purchases テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| user_id  | string | null: false |
| card_id  | string | null: false |
| item_id  | string | null: false |

### Association

- belongs_to :user
- belongs_to :product
