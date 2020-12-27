class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|
      t.integer :admin_id
      t.string :image_id
      t.text :introduction
      t.string :name

      t.timestamps
    end
  end
end
