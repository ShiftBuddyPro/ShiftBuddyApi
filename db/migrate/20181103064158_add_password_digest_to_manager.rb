class AddPasswordDigestToManager < ActiveRecord::Migration[5.1]
  def change
    add_column :managers, :password_digest, :string
  end
end
