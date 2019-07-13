class ItemDetail < ApplicationRecord
<<<<<<< HEAD
=======
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :size
>>>>>>> master
  belongs_to :item
end
