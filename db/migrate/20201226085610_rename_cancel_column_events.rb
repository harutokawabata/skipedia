class RenameCancelColumnEvents < ActiveRecord::Migration[5.2]
  def up
    change_column :events, :cancel, :integer, default: 0
  end
  def down
    change_column :events, :cancel, :boolean
  end
end
