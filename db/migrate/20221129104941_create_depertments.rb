class CreateDepertments < ActiveRecord::Migration[6.1]
  def change
    create_table :depertments do |t|
      t.string :department, :null => false, :default => '未所属'
      t.string :position, :null => false, :default => '一般部員'
      t.timestamps
    end
  end
end
