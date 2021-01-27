class ChangeIsFlagDefaultOnEventStatuses < ActiveRecord::Migration[5.2]
  def up
    change_column :event_statuses, :cancel, :integer, default: 0
  end
  def down
    change_column :event_statuses, :cancel, :integer
  end
end
