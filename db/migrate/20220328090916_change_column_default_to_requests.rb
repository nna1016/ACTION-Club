class ChangeColumnDefaultToRequests < ActiveRecord::Migration[6.1]
  def change
    change_column_default :requests, :status, from: nil, to: "info"
  end
end
