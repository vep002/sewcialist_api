class CreateMaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :materials do |t|
      t.string :name
      t.integer :quantity
      t.text :description
      t.boolean :in_inventory
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
