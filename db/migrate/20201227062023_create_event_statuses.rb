class CreateEventStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :event_statuses do |t|
      t.integer :event_id
      t.integer :user_id
      t.integer :cancel

      t.timestamps
    end
  end
end
