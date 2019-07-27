class ItemDetail < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :size
  belongs_to :item

  with_options presence: true do
    validates :condition
    # ToDo brand,sizeは実装したらバリデーションを加える
    # validates :size
    # validates :brand
  end
end
