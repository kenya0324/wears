class AddUserNameToPostImages < ActiveRecord::Migration[5.2]
  def change
    add_column :post_images, :user_name, :string
  end
end
