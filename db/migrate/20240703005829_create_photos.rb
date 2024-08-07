class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.string :image_url
      t.text :description
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
