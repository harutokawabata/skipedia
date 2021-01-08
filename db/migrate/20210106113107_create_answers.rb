class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :question_id
      t.integer :tag_id
      t.text :introduction
      t.string :link
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
