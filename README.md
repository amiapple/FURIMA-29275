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

### Association

- has_many :products
- has_many :comments
- has_one :credit_card
- has_one :profile

## products テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| name         | string | null: false |
| price        | string | null: false |
| category     | string | null: false |
| bland        | string | null: false |
| introduction | string | null: false |
| exhibitor    | string | null: false |
| condition    | string | null: false |
| postage      | string | null: false |
| shipping_area| string | null: false |
| preparation_day | string | null: false |
| buyer        | string | null: false |

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

## profiles テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| first_name   | string | null: false |
| family_name    | string | null: false |
| first_name_kana   | string | null: false |
| family_name_kana   | string | null: false |
| birthday   | string | null: false |
| user_id  | string | null: false |

### Association

- belongs_to :user

## credit_card テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| user_id  | string | null: false |
| card_id    | string | null: false |

### Association

- belongs_to :user

## products_images テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| image  | string | null: false |
| product_id    | string | null: false |

### Association

- belongs_to :product

## categories テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name  | string | null: false |

### Association

- has_many :product