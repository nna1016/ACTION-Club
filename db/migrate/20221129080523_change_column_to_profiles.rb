class ChangeColumnToProfiles < ActiveRecord::Migration[6.1]
  def change
    remove_column :profiles, :department, :string, default: "未所属", null: false
    remove_column :profiles, :position, :string, default: "一般部員", null: false
  end
end
