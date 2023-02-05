class RenameCollageIdColumnToCourses < ActiveRecord::Migration[6.1]
  def change
    rename_column :courses, :collage_id, :college_id
  end
end
