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

# usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|introduction|text||
|birthday|data||
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
## Association
- has_many :items
- has_many :comments
- has_many :deals
- has_many :delivry_addresses
- has_one :user-address
- has_one :avatar

# user_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|zip_code|string||
|prefecture|string||
|city|string||
|street_number|string||
|building|string||
|user_id|references|null: false, foreign_key: true|
## Association
- belongs_to :user

# delivery_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|zip_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|street_number|string|null: false|
|building|string||
|telephone|integer||
|user_id|references|null: false, foreign_key: true|
## Association
- belongs_to :user

# avatarsテーブル
|Column|Type|Options|
|------|----|-------|
|image|string||
|user:id|references|null: false, foreign_key: true|
## Association
- belongs_to :user

# paymentsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|string|null: false|
|user_id|references|null: false, foreign_key: true|
## Association
- belongs_to :user

# itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|description|text|null: false|
|sale_status|integer|null: false|
|buy_status|integer|null: false|
|user_id|references|null: false, foreign_key: true|
## Association
- belongs_to :user
- has_many :item_images
- has_many :comments
- has_one :shipping_origin
- has_one :category
- has_one :item_deal

# item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|url|string|null: false|
|item_id|references|null: false, foreign_key: true|
## Association
- belongs_to :item

# shipping_originsテーブル
|Column|Type|Options|
|------|----|-------|
|origin_region|integer|null: false|
|shipping_day|integer|null: false|
|shipping_method|integer|null: false|
|shipping_burden|boolean|null: false|
|item_id|references|null: false, foreign_key: true|
## Association
- belongs_to :item

# commentsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text||
|like|integer||
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
## Association
- belongs_to :user
- belongs_to :item

# dealsテーブル
|Column|Type|Options|
|------|----|-------|
|valuation|||
|user_id|references|null: false, foreign_key: true|
## Association
- belogns_to :user

# deal_has_user
|Column|Type|Options|
|------|----|-------|
