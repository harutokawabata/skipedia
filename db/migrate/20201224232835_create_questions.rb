class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :tag_id
      t.string :title
      t.text :introduction
      t.string :link
      t.string :is_active
      t.timestamps
    end
  end
end
