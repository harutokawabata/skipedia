class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name,          null: false
      t.string :introduction,   null: false
      t.integer :genre_id      

      t.timestamps
    end
  end
end
