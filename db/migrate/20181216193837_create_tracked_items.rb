class CreateTrackedItems < ActiveRecord::Migration[5.1]
  def change
    create_table :tracked_items do |t|
      t.string :name
      t.references :manager, foreign_key: true

      t.timestamps
    end
  end
end
