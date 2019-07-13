class ShippingOrigin < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :burden
  belongs_to_active_hash :prefecture
  belongs_to :item
end
