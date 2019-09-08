class AddPasswordDigestToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Password_digest, :string
  end
end
