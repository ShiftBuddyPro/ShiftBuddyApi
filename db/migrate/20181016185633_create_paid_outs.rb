class CreatePaidOuts < ActiveRecord::Migration[5.1]
  def change
    create_table :paid_outs do |t|
      t.string :company
      t.float :amount
      t.references :shift, foreign_key: true

      t.timestamps
    end
  end
end
