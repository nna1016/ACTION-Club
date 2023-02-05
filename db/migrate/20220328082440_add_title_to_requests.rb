class AddTitleToRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :requests, :titile, :string
  end
end
