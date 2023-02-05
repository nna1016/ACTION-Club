class RenameDepertmentIdColumnToProfiles < ActiveRecord::Migration[6.1]
  def change
    rename_column :profiles, :depertment_id, :department_id
  end
end
