class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.string  :code
      t.string  :department_id

      t.timestamps
    end
  end
end
