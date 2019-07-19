class ItemImage < ApplicationRecord
  belongs_to :item, optional: true
  mount_uploader :phot, ImageUploader

end
