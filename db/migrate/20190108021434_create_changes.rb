class CreateChanges < ActiveRecord::Migration[5.2]
  def change
    create_table :changes do |t|
      t.string :text
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
