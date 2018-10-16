class CreateCashDrops < ActiveRecord::Migration[5.1]
  def change
    create_table :cash_drops do |t|
      t.float :amount
      t.integer :number
      t.references :shift, foreign_key: true

      t.timestamps
    end
  end
end
