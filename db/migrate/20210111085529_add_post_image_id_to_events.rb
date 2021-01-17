class AddPostImageIdToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :post_image_id, :integer
  end
end
