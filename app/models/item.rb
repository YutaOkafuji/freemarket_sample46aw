class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user
  has_one :item_details
  has_many :item_images, dependent: :destroy
  has_one :shipping_origin
  accepts_nested_attributes_for :item_images
  accepts_nested_attributes_for :item_details
  accepts_nested_attributes_for :shipping_origin
end
