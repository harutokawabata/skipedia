class RemoveWatchwordFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :watchword, :string
  end
end
