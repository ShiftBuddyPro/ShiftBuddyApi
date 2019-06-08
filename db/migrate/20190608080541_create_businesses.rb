class CreateBusinesses < ActiveRecord::Migration[5.1]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :address1
      t.string :city
      t.string :state
      t.string :zip_code
      t.references :manager, foreign_key: true

      t.timestamps
    end
  end
end
