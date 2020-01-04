
class Like < ApplicationRecord
  belongs_to :post_image
  belongs_to :user
  validates_uniqueness_of :post_image_id, scope: :user_id
end
