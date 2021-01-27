class FixPostColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :customer_id, :user_id
  end
end
