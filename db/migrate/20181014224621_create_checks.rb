class CreateChecks < ActiveRecord::Migration[5.1]
  def change
    create_table :checks do |t|
      t.integer :number
      t.string :company
      t.float :amount
      t.references :shift, foreign_key: true

      t.timestamps
    end
  end
end
