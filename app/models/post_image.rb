class PostImage < ApplicationRecord
	 belongs_to :user
	 attachment :image
	 has_many :post_comments, dependent: :destroy
	 has_many :likes, dependent: :destroy
   has_many :liked_users, through: :likes, source: :user
   has_many :browsing_histories, dependent: :destroy
    def liked_by?(user)
      likes.where(user_id: user.id).exists?
    end

    def PostImage.search(search, user_or_post_image)
    if user_or_post_image == "2"
       PostImage.where(['item_name LIKE ?', "%#{search}%"])
    else
       PostImage.all
    end
    end
end
