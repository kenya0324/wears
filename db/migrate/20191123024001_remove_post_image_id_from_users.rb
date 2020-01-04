class RemovePostImageIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :post_image_id, :integer
  end
end
