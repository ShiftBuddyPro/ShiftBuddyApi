class CreateChangeSheets < ActiveRecord::Migration[5.1]
  def change
    create_table :change_sheets do |t|
      t.references :shift, foreign_key: true
      t.integer :start_pennies
      t.integer :start_nickels
      t.integer :start_dimes
      t.integer :start_quarters
      t.integer :start_ones
      t.integer :start_fives
      t.integer :start_tens
      t.integer :start_twenties
      t.integer :end_pennies
      t.integer :end_nickels
      t.integer :end_dimes
      t.integer :end_quarters
      t.integer :end_ones
      t.integer :end_fives
      t.integer :end_tens
      t.integer :end_twenties

      t.timestamps
    end
  end
end
