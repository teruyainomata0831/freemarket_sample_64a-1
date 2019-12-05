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


## userテーブル
|Column|Type|Options|
|------|----|-------|
|avatar_image|string||
|nickname|string|null: false|
|biography|string|text|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false, unique: true|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|integer||
|birth_month|integer||
|birth_day|integer||
|phone_number|string|null: false, unique: true|
|is_phone_number_authenticated|string|null: false, unique: true|

### Association
- has_many :items
- belongs_to :credit
- belongs_to :address


## creditテーブル
|Column|Type|Options|
|card_number|integer|null: false, unique: true|
|exp_month|integer|null: false, unique: true|
|ep_year|integer|null: false, unique: true|

### Association
- belongs_to :user


## addressテーブル
|Column|Type|Options|
|postcode|string|null: false|
|prefeture|string|null: false|
|city|string|null: false|
|block|string|text|
|building|string|text|

### Association
- belongs_to :user


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|
|status|string|null: false|
|delivery_fee|string|null: false|
|method|string|null: false|
|date|string|null: false|
|price|integer|null: false|
|users_id|integer|null: false|
|brands_id|integer|null: false|
|regions_id|integer|null: false|

## Association
- belongs_to :user
- belongs_to :brand
- belongs_to :category
- has_many :image


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- has_many :items


## category
|column|type|options|
|name|string|text, null false|

### Association
- has_many: items,thourgh: :categories_items
- has_many: categories_items


### category_itemsテーブル
|column|type|options|
|------|----|-------|
|category_id|reference|null: false, foreign_key: true|
|item_id|reference|null: false, foreign_key: true|

- belongs_to :item
- belongs_to :category