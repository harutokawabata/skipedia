class UserFixStatus < ActiveRecord::Migration[5.2]
  def change
    # t.string "email", default: "", null: false
    # t.string "encrypted_password", default: "", null: false
    # t.string "reset_password_token"
    # t.datetime "reset_password_sent_at"
    # t.datetime "remember_created_at"
    # t.string "name"
    # t.string "watchword"
    change_column :users, :popular, :string, default: 0
    change_column :users, :is_deleted, :boolean, default: false
    # t.datetime "created_at", null: false
  end
  
  def down
    # t.string "email", default: "", null: false
    # t.string "encrypted_password", default: "", null: false
    # t.string "reset_password_token"
    # t.datetime "reset_password_sent_at"
    # t.datetime "remember_created_at"
    # t.string "name"
    # t.string "watchword"
    # t.string "popular"
    # t.boolean "is_deleted"
    # t.datetime "created_at", null: false
    change_column :users, :popular, :string
    change_column :users, :is_deleted, :boolean
  end
end
