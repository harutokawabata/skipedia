class FixColumnQuestion123 < ActiveRecord::Migration[5.2]
  def change
    change_column_default :questions, :is_active, from: "f", to: false
  end
end
