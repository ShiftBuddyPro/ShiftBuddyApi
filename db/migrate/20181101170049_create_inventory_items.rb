class CreateInventoryItems < ActiveRecord::Migration[5.1]
  def change
    create_table :inventory_items do |t|
      t.string :name
      t.integer :start_amount
      t.integer :end_amount
      t.references :shift, foreign_key: true

      t.timestamps
    end
  end
end
