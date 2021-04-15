class ItemImage < ApplicationRecord
    belongs_to :gym, optional: true
    mount_uploader :image, ImageUploader
end
