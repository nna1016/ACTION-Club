class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.integer :user_id
      t.string :updater
      t.datetime :in
      t.datetime :out
      t.date :date

      t.timestamps
    end
  end
end
