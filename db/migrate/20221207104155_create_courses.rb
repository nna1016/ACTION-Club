class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :collage_id
      t.string :name
      t.string :symbol
      t.integer :year
      t.string :status

      t.timestamps
    end
  end
end
