class RenameCustomerIdColumnEvents < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :customer_id, :user_id
  end
end
