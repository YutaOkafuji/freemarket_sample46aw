# usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|text|null: false, unique: true|
|password|string|null: false|
|avatar|text||
|profit|integer|null: false|
|point|integer|null: false|
## Association
- has_many :items, dependent: :destroy
- has_many :comments
- has_many :deals, through: :deals_users
- has_many :delivery_addresses, dependent: :destroy
- has_one :profile, dependent: :destroy
- has_one :user_address, dependent: :destroy

# profilesテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, length: { maximum: 20 }|
|introduction|text||
|birthday|date||
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|user_id|references|null: false, foreign_key: true|
## Association
- belongs_to :user

# user_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|zip_code|string|length: { maximum: 8 }|
|prefecture_id|integer||
|city|string||
|street_number|string||
|building|string||
|user_id|references|null: false, foreign_key: true|
## Association
- belongs_to :user

# delivery_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|zip_code|string|null: false, length: { maximum: 8 }|
|prefecture_id|integer|null: false|
|city|string|null: false|
|street_number|string|null: false|
|building|string||
|telephone|string||
|user_id|references|null: false, foreign_key: true|
## Association
- belongs_to :user

# itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, length: { maximum: 40 }|
|price|integer|null: false|
|description|text|null: false, length: { maximum: 1000 }|
|sale_status|integer|null: false|
|buy_status|integer|null: false|
|user_id|references|null: false, foreign_key: true|
## Association
- belongs_to :user
- has_many :comments, dependent: :destroy
- has_many :item_images, dependent: :destroy
- has_one :shipping_origin, dependent: :destroy
- has_one :category, dependent: :destroy
- has_one :item_detail, dependent: :destroy

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
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
## Association
- belongs_to :user
- belongs_to :item

# likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
## Association
- belongs_to :user
- belongs_to :item

# dealsテーブル
|Column|Type|Options|
|------|----|-------|
|valuation|integer||
|user_id|references|null: false, foreign_key: true|
## Association
- belongs_to :user, through: :deals_users

# deals_usersテーブル
|Column|Type|Options|
|------|----|-------|
|deal_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
## Association
- belongs_to :deal
- belongs_to :user

# item_detailテーブル
|Column|Type|Options|
|------|----|-------|
|size|integer|null: false|
|brand|string||
|condition|integer|null: false|
|item_id|references|null: false, foreign_key: true|
## Association
- belongs_to :item

# categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|parent_id|string|null: false|
|item_id|references|null: false, foreign_key: true|
## Association
- belongs_to :item
- belongs_to :parent, class_name: :Category
- has_many :children, class_name: :Category, foreign_key: :parent_id

# newsテーブル
|Column|Type|Options|
|------|----|-------|
|title|sting|null: false|
|content|string|null: false|
## Association
- nothing
