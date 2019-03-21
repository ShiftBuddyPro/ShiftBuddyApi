class AddStatusToShifts < ActiveRecord::Migration[5.1]
  def change
    add_column :shifts, :status, :integer
  end
end
