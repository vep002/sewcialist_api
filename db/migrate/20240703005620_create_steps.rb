class CreateSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :steps do |t|
      t.text :description
      t.date :start_date
      t.date :end_date
      t.boolean :completed
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
