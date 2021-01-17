class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.integer :answer_id
      t.integer :event_id
      t.integer :post_id
      t.integer :question_id
      t.integer :user_id
      t.integer :event_entry_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
