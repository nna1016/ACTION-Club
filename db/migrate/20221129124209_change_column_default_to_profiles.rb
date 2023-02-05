class ChangeColumnDefaultToProfiles < ActiveRecord::Migration[6.1]
  def change
    change_column_default :profiles, :department_id, from: nil, to: "0"
  end
end
