class AddPostImageIdToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :post_image_id, :integer
  end
end
