class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :question_id
      t.integer :customer_id
      t.integer :genre_id
      t.integer :tag_id
      t.string :title
      t.text :introduction
      t.string :link
      t.integer :status

      t.timestamps
    end
  end
end
