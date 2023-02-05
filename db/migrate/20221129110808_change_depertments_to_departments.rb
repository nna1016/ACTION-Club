class ChangeDepertmentsToDepartments < ActiveRecord::Migration[6.1]
  def change
    rename_table :depertments, :departments
  end
end
