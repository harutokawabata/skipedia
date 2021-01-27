class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :customer_id
      t.integer :date
      t.integer :start
      t.integer :finish
      t.integer :entry_fee
      t.string :organizer
      t.text :event_detail
      t.integer :event_status
      t.integer :capacity
      t.boolean :cancel
      t.string :name

      t.timestamps
    end
  end
end
