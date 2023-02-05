class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.string :user_id
      t.string :kind
      t.string :status
      t.string :approver

      t.timestamps
    end
  end
end
