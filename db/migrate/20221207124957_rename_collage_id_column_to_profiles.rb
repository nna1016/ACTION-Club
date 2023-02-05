class RenameCollageIdColumnToProfiles < ActiveRecord::Migration[6.1]
  def change
    rename_column :profiles, :collage_id, :course_id
  end
end
