class AdddepertmentIdToprofiles < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :depertment_id, :integer, null: false
  end
end
