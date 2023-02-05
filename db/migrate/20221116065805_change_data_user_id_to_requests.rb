class ChangeDataUserIdToRequests < ActiveRecord::Migration[6.1]
  def change
    change_column :requests, :user_id, :integer
  end
end
