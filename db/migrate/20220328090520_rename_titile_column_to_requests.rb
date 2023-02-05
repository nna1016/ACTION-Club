class RenameTitileColumnToRequests < ActiveRecord::Migration[6.1]
  def change
    rename_column :requests, :titile, :title
  end
end
