class CreateEventEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :event_entries do |t|
      t.integer :user_id
      t.integer :event_id
      t.integer :cancel, default: 0

      t.timestamps
    end
  end
end
