class RemoveColumnFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :cancel, :string
  end
end
