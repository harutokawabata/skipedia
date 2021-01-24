class ChangeDatetypeDateOfEvents < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :date, :string
    change_column :events, :start, :string
    change_column :events, :finish, :string
  end
end
