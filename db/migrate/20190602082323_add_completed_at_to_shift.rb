class AddCompletedAtToShift < ActiveRecord::Migration[5.1]
  def change
    add_column :shifts, :completed_at, :datetime
  end
end
