class ChangeColumnDefaultToProfilesss < ActiveRecord::Migration[6.1]
  def change
    change_column_default :profiles, :department_id, from: "0", to: "1"
  end
end
