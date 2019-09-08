class AddUserIdToTasklist < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasklists, :user_id, foreign_key: true
  end
end
