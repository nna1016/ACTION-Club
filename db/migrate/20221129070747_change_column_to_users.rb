class ChangeColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:users, :role_id, from: 1, to: 2100000)
  end
end
