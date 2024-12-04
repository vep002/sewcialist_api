class RemoveProjectidFromPhotos < ActiveRecord::Migration[6.1]
  def change
    remove_column :photos, :project_id, :integer
  end
end
