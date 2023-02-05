class AddTargetToRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :requests, :target, :integer
  end
end
