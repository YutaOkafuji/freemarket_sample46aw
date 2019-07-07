class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user
  has_many :item_images, dependent: :destroy
  has_one :item_detail
  accepts_nested_attributes_for :item_detail
  accepts_nested_attributes_for :item_images
end
