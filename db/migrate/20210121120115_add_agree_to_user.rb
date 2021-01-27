class AddAgreeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :agree, :string, default: false
  end
end
