class RenameImgColumnToProfiles < ActiveRecord::Migration[6.1]
  def change
    rename_column :profiles, :img, :image
  end
end
