class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :username, :null => false
      t.string :ruby, :null => false
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :nickname, :null => false
      t.date :dob, :null => false
      t.string :sex, :null => false
      t.string :phone, :null => false
      t.string :student_num, :null => false
      t.integer :collage_id
      t.string :teacher_name, :null => false
      t.string :commute, :null => false
      t.string :parent_name, :null => false
      t.string :parent_phone, :null => false
      t.string :parent_address, :null => false
      t.string :department, :null => false, :default => '未所属'
      t.string :position, :null => false, :default => '一般部員'
      t.timestamps
      t.datetime :leaved_at
    end
  end
end
