class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images
  accepts_nested_attributes_for :item_details
end
