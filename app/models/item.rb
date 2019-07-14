class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :item_images, dependent: :destroy
  has_one :item_detail, dependent: :destroy
  has_one :shipping_origin, dependent: :destroy
  has_one :category, dependent: :destroy
  accepts_nested_attributes_for :item_detail
  accepts_nested_attributes_for :item_images
end
