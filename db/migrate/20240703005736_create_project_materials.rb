class CreateProjectMaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :project_materials do |t|
      t.references :project, null: false, foreign_key: true
      t.references :material, null: false, foreign_key: true

      t.timestamps
    end
  end
end
