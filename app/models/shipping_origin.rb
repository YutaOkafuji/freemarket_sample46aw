class ShippingOrigin < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :burden
  belongs_to_active_hash :delivery_date
  belongs_to_active_hash :delivery_method
  belongs_to :item

  with_options presence: true do
    validates :prefecture_id
    validates :burden_id
    validates :delivery_date_id
    # ToDo delivery_method_idは実装したらバリデーションを加える
    # validates :delivery_method_id
  end
end
