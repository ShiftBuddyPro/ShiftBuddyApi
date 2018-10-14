class CreateShifts < ActiveRecord::Migration[5.1]
  def change
    create_table :shifts do |t|
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
