class AddstatusToprofiles < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :status, :string
  end
end
