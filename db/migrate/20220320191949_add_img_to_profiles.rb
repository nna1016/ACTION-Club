class AddImgToProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :img, :string
  end
end
